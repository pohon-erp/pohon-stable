<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Devel extends MX_Controller{

   public function __construct(){
		parent::__construct();
		$this->db = $this->load->database('default', TRUE);
		$this->load->model("devel/devel_model", "dev");
		if (!$this->input->is_cli_request()) exit('Only CLI access allowed');
    }
    
    public function install(){
        $this->dev->install();
    }

    public function update_schema() {
        $folder = FCPATH.'/sql';
        $files = glob($folder . '/*');
        foreach($files as $file){
            if(is_file($file)){ 
                unlink($file);
            }
        }
        echo exec('pg_dump -U '.$this->db->username.' --schema-only '.$this->db->database .' > '.FCPATH.'/sql/db_schema.sql');
    }
    
    public function update_index(){
		$this->dev->sync_index();
	}


}