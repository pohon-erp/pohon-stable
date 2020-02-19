<?php defined('BASEPATH') OR exit('No direct script access allowed');

if (!function_exists('date_now')) {
    function date_now() {
        return date("Y-m-d H:i:s");
    }
}


if (!function_exists('checkFile')) {
    function checkFile($path = null) {
        if (!is_null($path)) {
            if (file_exists(FCPATH . "" . $path)) {
                return true;
            }
        }
        return false;
    }
}

if (!function_exists('isHasFile')) {
    function isHasFile($name = 'file') {
        if ($_FILES[$name]['error'] == 4) {
            return false;
        }
        return true;
    }
}

if (!function_exists('getVal')) {
    function getVal($data, $key) {
	    if(isset($data->$key)){
			return $data->$key;
		}
		return null;
    }
}

if (!function_exists('selectCustom')) {
    function selectCustom(array $items, $name, $placeholder = 'Select Item', $id_selected = null) {
        $option = null;
        if (is_null($id_selected)) {
            $option .= '<option disabled selected>--' . $placeholder . '--</option>';
        } else {
            $option .= '<option disabled>--' . $placeholder . '--</option>';
        }
        foreach ($items as $row) {
            $selected = $row["id"] == $id_selected ? "selected" : "";
            $option .= '<option value="' . $row["id"] . '" ' . $selected . ' >' . $row["name"] . '</option>';
        }
        return "<select name='" . $name . "' id='" . $name . "' class='form-control select2'>" . $option . "</select>";
    }
}

if (!function_exists('selectMultipleCustom')) {
    function selectMultipleCustom(array $items, $name, $placeholder = 'Select Item', $id_selected = null) {
        $option = null;
        foreach ($items as $row) {
            $selected = "";
            if (!is_null($id_selected)) {
                foreach ($id_selected as $ids) {
                    if ((int) $ids == (int) $row["id"]) {
                        $selected = "selected";
                    }
                }
                $option .= '<option value="' . $row["id"] . '" ' . $selected . ' >' . $row["name"] . '</option>';
            } else {
                $option .= '<option value="' . $row["id"] . '" ' . $selected . ' >' . $row["name"] . '</option>';
            }
        }
        return "<select multiple='multiple' name='" . $name . "' id='" . $name . "' class='form-control select2'>" . $option . "</select>";
    }

}

if (!function_exists('imageExists')) {
    function imageExists($path = null) {
        if (!is_null($path)) {
            if (file_exists($path)) {
                return site_url($path);
            }
        }
        return site_url('assets/no-image.png');
    }
}

if (!function_exists('strRandom')) {
    function strRandom($length = 10) {
        $characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        $charactersLength = strlen($characters);
        $randomString = "";
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}

if (!function_exists('uploadFile')) {
    function uploadFile($fileName = "file", $pathTarget = "uploads", $type = "gif|jpg|png") {
        if ($_FILES[$fileName]) {
            if (!is_dir(FCPATH . "/" . $pathTarget . "/")) {
                mkdir(FCPATH . "/" . $pathTarget . "/", '0777', true);
            }
            $CI = get_instance();
            $CI->load->library('upload');
            $config['upload_path'] = FCPATH . "/" . $pathTarget . "/";
            $config['allowed_types'] = $type;
            $config['max_size'] = '8192';
            $config['overwrite'] = true;
            $config['file_name'] = gen_uuid(4);
            $CI->upload->initialize($config);
            if ($CI->upload->do_upload($fileName)) {
                $saved_file_name = $CI->upload->data('file_name');
                return $pathTarget . "/" . $saved_file_name;
            }
        }
        return null;
    }
}

if (!function_exists('curPageURL')) {
    function curPageURL() {
        $protocol = ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        return $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
    }
}

if (!function_exists('get_client_ip')) {
    function get_client_ip() {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {   //check ip from share internet
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {   //to check ip is pass from proxy
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }
}


if (!function_exists('slugify')) {
    function slugify($text){
		$text = preg_replace('~[^\pL\d]+~u', '-', $text);
		$text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
		$text = preg_replace('~[^-\w]+~', '', $text);
		$text = trim($text, '-');
		$text = preg_replace('~-+~', '-', $text);
		$text = strtolower($text);
		if (empty($text)) {
			return 'n-a';
		}
		return $text;
	}
}

if (!function_exists('gen_uuid')) {
    function gen_uuid($type = 1) {
		$CI = get_instance();
		$CI->load->library("Uniqueid");
		return $CI->uniqueid->generate($type);
    }
}

if (!function_exists('cropAndUpload')) {

    function cropAndUpload($path) {
        require_once APPPATH . '/libraries/CropImage.php';
        $avatarSrc = isset($_POST['avatar_src']) ? $_POST['avatar_src'] : null;
        $avatarData = isset($_POST['avatar_data']) ? $_POST['avatar_data'] : null;
        $avatarFile = isset($_FILES['avatar_file']) ? $_FILES['avatar_file'] : null;
        $crop = new CropImage($avatarSrc, $avatarData, $avatarFile);
        $result = $crop->getResult();
        $realImage = $result;
        if (!is_dir(FCPATH . "" . $path)) {
            mkdir(FCPATH . "" . $path, '0777', true);
        }
        $arr_photo = explode('/', $result);
        $photo = $path . '/' . end($arr_photo);
        $copy = copy(FCPATH . '' . $result, FCPATH . '' . $photo);
        if ($copy) {
            $realImage = $photo;
            if ($crop->getOriginal()) {
                $original = $crop->getOriginal();
                if (file_exists(FCPATH . '' . $original)) {
                    unlink(FCPATH . '' . $original);
                }
            }
            unlink(FCPATH . '' . $result);
        }
        $response = array(
            'state' => 200,
            'message' => $crop->getMsg(),
            'path' => $realImage,
            'result' => site_url($realImage)
        );
        return $response;
    }

}

if (!function_exists('app_debug')) {
    function app_debug($data) {
		var_dump($data); die();
    }
}

if (!function_exists('audit_store')) {
    function audit_store($oldValue, $newValue, $event, $auditable_id, $auditable_type) {
		$CI = get_instance();
		$CI->load->model('core/Audit_model', 'audit');
		$CI->audit->store($oldValue, $newValue, $event, $auditable_id, $auditable_type);
    }
}


