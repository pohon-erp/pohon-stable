<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Permission_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->db = $this->load->database('default', TRUE);
    }

    public function createDefaultPermission() {
        $json = file_get_contents(FCPATH . "seeds/routes.json");
        $routes = json_decode($json, true);
        $i = 1;
        foreach ($routes as $row) {
            $this->createRoutes($row, $i);
            $i++;
        }
    }

    private function createRoutes($row, $sort, $parent_id = null) {
        $insertData = array(
            "parent_id" => $parent_id,
            "name" => isset($row["name"]) ? $row["name"] : null,
            "url" => isset($row["url"]) ? $row["url"] : null,
            "icon" => isset($row["icon"]) ? $row["icon"] : null,
            "sort" => $sort,
        );
        $this->db->insert("auth_routes", $insertData);
        $route_id = $this->db->insert_id();
        if (isset($row["childs"])) {
            $childs = $row["childs"];
            if (count($childs) > 0) {
                $i = 1;
                foreach ($childs as $child) {
                    $this->createRoutes($child, $i, $route_id);
                    $i++;
                }
            }
        }
    }

    public function syncRoles() {
        $roles = $this->db->get("auth_roles")->result();
        foreach ($roles as $role) {
            $routes = $this->db->get("auth_routes")->result();
            foreach ($routes as $route) {
                $data = array();
                $data["route_id"] = $route->id;
                $data["role_id"] = $role->id;
                $data["can_view"] = 1;
                if (slugify($role->name) == slugify("admin")) {
                    $data["can_create"] = 1;
                    $data["can_edit"] = 1;
                    $data["can_delete"] = 1;
                } else {
                    $data["can_create"] = 0;
                    $data["can_edit"] = 0;
                    $data["can_delete"] = 0;
                }
                $this->db->insert("auth_permissions", $data);
            }
        }
    }

    public function getMenuUser() {

        $user_id = auth_user()->id;
        $this->db->where("user_id", $user_id);
        $roles = $this->db->get("auth_users_roles")->result();

        $role_id = array();
        foreach ($roles as $row) {
            $role_id[] = (int) $row->role_id;
        }

        if (count($role_id) > 0) {
            $this->db->distinct();
            $this->db->select('route_id');
            $this->db->where('role_id IN (' . implode(",", $role_id) . ')', NULL, FALSE);
            $permission = $this->db->get("auth_permissions")->result();
            $route_id = array();

            if (count($permission) > 0) {

                foreach ($permission as $row) {
                    $route_id[] = (int) $row->route_id;
                }

                $this->db->distinct();
                $this->db->where('parent_id', null);
                $this->db->where('id IN (' . implode(",", $route_id) . ')', NULL, FALSE);
                $this->db->order_by('sort', 'ASC');
                $data = $this->db->get('auth_routes')->result();
                if (count($data) > 0) {
                    foreach ($data as $row) {
                        $this->createMenuAuth($row, $route_id);
                    }
                }
            }
        }
    }

    public function createMenuAuth($parent, array $route_id) {
        $this->db->distinct();
        $this->db->where('parent_id', $parent->id);
        $this->db->where('id IN (' . implode(",", $route_id) . ')', NULL, FALSE);
        $this->db->order_by('sort', 'ASC');
        $data = $this->db->get('auth_routes')->result();
        $url = is_null($parent->url) ? "javascript:void(0);" : base_url($parent->url);
        $icon = is_null($parent->icon) ? "far fa-circle" : $parent->icon;
        if (count($data) > 0) {
            echo '
				<li class="nav-item has-treeview">
					<a href="' . $url . '" class="nav-link">
						<i class="nav-icon ' . $icon . '"></i>
						<p>
							' . $parent->name . '
							<i class="right fas fa-angle-left"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">';
            foreach ($data as $row) {
                $this->createMenuAuth($row, $route_id);
            }
            echo '
			       </ul>
				</li>
			';
        } else {
            echo '
		   	<li class="nav-item">
				<a href="' . $url . '" class="nav-link">
					<i class="nav-icon ' . $icon . '"></i>
					<p>' . $parent->name . '</p>
				</a>
			</li>
		   ';
        }
    }

    public function getPermission($url, $action) {
        $user = auth_user();
        $this->db->select([
            "auth_users_roles.user_id",
            "auth_users_roles.role_id",
        ]);
        $this->db->join("auth_permissions", "auth_permissions.role_id = auth_users_roles.role_id");
        $this->db->join("auth_routes", "auth_routes.id = auth_permissions.route_id");
        $this->db->where("auth_permissions." . $action, 1);
        $this->db->where("auth_routes.url", $url);
        $this->db->where("auth_users_roles.user_id", $user->id);
        $result = $this->db->get("auth_users_roles")->num_rows();
        return (int) $result > 0 ? true : false;
    }

    public function getHomeUrl($id = null) {
        $user_id = is_null($id) ? auth_user()->id : $id;
        $this->db->select([
            "auth_users_roles.user_id",
            "auth_users_roles.role_id",
            "auth_routes.url"
        ]);
        $this->db->join("auth_permissions", "auth_permissions.role_id = auth_users_roles.role_id");
        $this->db->join("auth_routes", "auth_routes.id = auth_permissions.route_id");
        $this->db->where("auth_users_roles.user_id", $user_id);
        $this->db->where("auth_routes.url !=", "javascript:void(0);");
        $this->db->where("auth_permissions.can_view", 1);
        $this->db->order_by("auth_routes.id", "ASC");
        $this->db->order_by("auth_routes.sort", "ASC");
        $this->db->limit(1);
        $result = $this->db->get("auth_users_roles")->row();
        if (!is_null($result)) {
            return $result->url;
        }
        return "account/profile";
    }

    public function tablePermission() {
        $this->db->distinct();
        $this->db->where('auth_routes.parent_id', null);
        $this->db->order_by('auth_routes.id', 'ASC');
        $this->db->order_by('auth_routes.sort', 'ASC');
        $data = $this->db->get('auth_routes')->result();
        if (!is_null($data)) {
            foreach ($data as $row) {
                $this->tablePermissionRow($row);
            }
        }
    }

    private function tablePermissionRow($parent, $level = 0, $has_child = false) {

        $this->db->distinct();
        $this->db->where('auth_routes.parent_id', $parent->id);
        ;
        $this->db->order_by('auth_routes.name', 'ASC');
        $data = $this->db->get('auth_routes')->result();

        $menu_id = $parent->id;
        $parentId = $parent->parent_id ? $parent->parent_id : $parent->id;

        $hasChild = $has_child ? "is_child" : "is_parent";
        $isSecure = null;
        $isChecked = null;
        $checkbox = "<input type='checkbox' name='routes[]' value='" . $menu_id . "' id='menu" . $menu_id . "' class=' menu  " . $hasChild . " parent" . $parentId . "' data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />";
        $menuName = $has_child ? "" . $this->checkBoxWrapper($checkbox, $parent->name, $level) : "" . $this->checkBoxWrapper($checkbox, $parent->name, $level) . "";

        if (count($data) > 0) {
            if (isset($parent->url) && !is_null($parent->url)) {

                $can_upload = $this->routeCanUpload($parent->url);
                $upload = "<td class='text-center'><i class='fa fa fa-ban'></i></td>";
                if($can_upload){
                    $upload = "<td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_upload" . $menu_id . "' name='can_upload" . $menu_id . "' value='1'  class=' permission upload'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>";
                }

                echo "
                    <tr>
                        <td>" . $menuName . "</td>
                        <td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_view" . $menu_id . "' name='can_view" . $menu_id . "' value='1'  class=' permission view'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
                        <td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_add" . $menu_id . "' name='can_add" . $menu_id . "' value='1'  class=' permission create'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
                        <td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_edit" . $menu_id . "' name='can_edit" . $menu_id . "' value='1'  class=' permission edit'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
						<td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_delete" . $menu_id . "' name='can_delete" . $menu_id . "' value='1'  class=' permission delete'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
						".$upload."
						<td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_download" . $menu_id . "' name='can_download" . $menu_id . "' value='1'  class=' permission download'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
						<td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_approve" . $menu_id . "' name='can_approve" . $menu_id . "' value='1'  class=' permission approve'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
                    </tr>
                ";
            } else {
                echo
                "<tr>
					<td>" . $menuName . "</td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
				</tr>";
            }
            $level++;
            foreach ($data as $row) {
                $this->tablePermissionRow($row, $level, true);
            }
        } else {
            if (isset($parent->url) && !is_null($parent->url)) {

                $can_upload = $this->routeCanUpload($parent->url);
                $upload = "<td class='text-center'><i class='fa fa fa-ban'></i></td>";
                if($can_upload){
                    $upload = "<td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_upload" . $menu_id . "' name='can_upload" . $menu_id . "' value='1'  class=' permission upload'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>";
                }

                echo "
                    <tr class='" . $isSecure . "'>
                        <td>" . $menuName . "</td>
                        <td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_view" . $menu_id . "' name='can_view" . $menu_id . "' value='1'  class=' permission view'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
                        <td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_add" . $menu_id . "' name='can_add" . $menu_id . "' value='1'  class=' permission create'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
                        <td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_edit" . $menu_id . "' name='can_edit" . $menu_id . "' value='1'  class=' permission edit'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
						<td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_delete" . $menu_id . "' name='can_delete" . $menu_id . "' value='1'  class=' permission delete'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
						".$upload."
						<td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_download" . $menu_id . "' name='can_download" . $menu_id . "' value='1'  class=' permission download'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
						<td class='text-center'>" . $this->checkBoxWrapper("<input type='checkbox' id='can_approve" . $menu_id . "' name='can_approve" . $menu_id . "' value='1'  class=' permission approve'  data-menu-id='" . $menu_id . "'  data-parent-id='" . $parentId . "' " . $isChecked . "  />", null, 0, false) . "</td>
                    </tr>
                ";
            } else {
                echo
                "<tr>
					<td>" . $menuName . "</td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
					<td class='text-center'><i class='fa fa fa-ban'></i></td>
				</tr>";
            }
        }
    }

    private function createSpace($param = null) {
        $html = "&nbsp&nbsp";
        $max = $param * 5;
        for ($i = 0; $i < $max; $i++) {
            $html .= "&nbsp;";
        }
        return $html;
    }

    private function checkBoxWrapper($checkbox, $name = null, $space = 0, $withIcon = true) {
        if ($withIcon) {
            return '
                ' . $this->createSpace($space) . '<i class="fas fa-arrow-right"></i>&nbsp;' . $checkbox . '&nbsp;&nbsp;&nbsp;' . $name . '
            ';
        } else {
            return $checkbox;
        }
    }

    private function routeCanUpload($route){
        $routes = array(
            "javascript:void(0);",
            "setting/audit",
            "setting/user",
            "setting/role"
        );
        for($i = 0; $i < count($routes); $i++){
            if($routes[$i] == $route){
                return FALSE;
            }
        }
        return TRUE;
    }

}
