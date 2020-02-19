<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once FCPATH . 'vendor/fzaninotto/faker/src/autoload.php';

class Devel_model extends CI_Model{

	private $faker;

	public function __construct(){
		parent::__construct();
		date_default_timezone_set('Asia/Jakarta');
		$this->load->library('ion_auth');
		$this->load->model("auth/Permission_model", "permission");
		$this->db = $this->load->database('default', TRUE);
		$this->faker = Faker\Factory::create('id_ID');
	}

	public function install(){

		$this->sync_index();

		echo date_now()." >> Memulai Seed...\n";
		$this->permission->createDefaultPermission();
		echo date_now()." >> Berhasil membuat route dan hak akses...\n";
	
		$this->roles();
		$this->permission->syncRoles();
		echo date_now()." >> Berhasil membuat role...\n";

		$this->users();
		echo date_now()." >> Berhasil membuat pengguna...\n";

		echo date_now()." >> Install berhasil...\n";
		echo date_now()." >> Silahkan login dengan akun ini...\n";
        echo date_now()." ==============================\n";
        echo date_now()." >> Administrator : \n";
		echo date_now()." >> Username : admin\n";
		echo date_now()." >> Email : admin@admin.com\n";
        echo date_now()." >> Password : password\n";
		echo date_now()." ==============================\n";
		
	}

	public function roles(){
		$roles = $this->defaultRoles();
		foreach($roles as $role){
			$data = array(
				"name"=>$role,
				"description"=>$this->faker->paragraph
			);
			$this->db->insert("auth_roles", $data);
		}
	}

	public function users(){

		$this->db->where("name", "Admin");
		$this->db->limit(1);
		$role = $this->db->get("auth_roles")->row();

		$email = "admin@admin.com";
		$identity = "admin";
		$password = "password";
		$this->ion_auth->register($identity, $password, $email, array(), [$role->id]);

		for($i = 1; $i < 100; $i++){

			$this->db->where('name !=', 'Admin');
			$this->db->order_by('random()');
			$this->db->limit(1);
			$otherRole = $this->db->get("auth_roles")->row();
			$email = $this->faker->unique()->safeEmail;
			$identity = $this->faker->unique()->userName;
			$user_id = $this->ion_auth->register($identity, $password, $email, array(), [$otherRole->id]);
			$this->db->insert("employee.ref_employees", ["user_id" => $user_id]);

		}

	}

	public function updateRoutes(){
		echo date_now()." >> Memperbaharui route dan hak akses ...\n";

		$this->db->trans_start();

		$this->db->where("id <>", 0);
		$this->db->delete("auth_permissions");

		$this->db->where("id <>", 0);
		$this->db->delete("auth_routes");

		$this->permission->createDefaultPermission();
		$this->permission->syncRoles();

		$this->db->trans_complete();

		echo date_now()." >> berhasil memperbaharui hak akses...\n";
	}

	public function dropAllTable(){
		$sql = "
			SELECT DISTINCT table_schema,table_name
			FROM information_schema.columns 
			WHERE udt_catalog = 'sandy_erp'
			AND table_schema IN ('public','employee','inventory','customer','accounting','production')
			GROUP BY table_schema,table_name
		";
		$data = $this->db->query($sql)->result_array();
		foreach($data as $row){
			$table_name = $row["table_name"];
			$table_schema  = $row["table_schema"];
			$this->db->query("DROP TABLE IF EXISTS ".$table_schema.".".$table_name."");
		}
	}

	public function sync_index(){

		// Drop All Index Exsisting
		$listSchema = "('public','employee','inventory','customer','accounting','production')";
		$sql = "SELECT indexname,schemaname FROM pg_indexes WHERE schemaname IN ".$listSchema." AND indexname LIKE '%idx%'";
		$data = $this->db->query($sql)->result_array();
		foreach($data as $row){
			$index_name = $row["indexname"];
			$schema_name  = $row["schemaname"];
			$this->db->query("DROP INDEX CONCURRENTLY IF EXISTS  ".$schema_name.".".$index_name."");
		}

		//Create Index
		$sql2 = "
			SELECT table_name, column_name , data_type, table_schema
			FROM information_schema.columns 
			WHERE udt_catalog = '".$this->db->database."'
			AND table_schema IN ('public','employee','inventory','customer','accounting','production')
			AND column_name != 'id'
			AND data_type IN ('bigint','integer','text','character varying','float','double')
		";
		$data2 = $this->db->query($sql2)->result_array();
		foreach($data2 as $row){
			$schema = $row["table_schema"];
			$table = $row["table_name"];
			$column =  $row["column_name"];
			$_index_name =  slugify($schema." ".$table." ".$column." idx");
			$index_name = str_replace("-", "_", $_index_name);
			$this->db->query("CREATE INDEX ".$index_name." ON  ".$schema.".".$table." USING BTREE (".$column.")");
		}
	}
	

	private function defaultRoles(){
		return [
			"Admin", 
			"User",
			"Receptionist", 
			"Supervisor", 
			"Chief Executive Officer",
			"Chief Operating Officer",
			"Vice President of Marketing",
			"Chief Financial Officer",
			"Vice President of Production",
			"Operations manager",
			"Quality control",
			"Accountant",
			"Office manager",
			"Marketing manager",
			"Purchasing manager",
			"Professional staff"
		];
	}

}
