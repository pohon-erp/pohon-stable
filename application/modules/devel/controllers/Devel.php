<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Devel extends MX_Controller{

   public function __construct(){
		parent::__construct();
		$this->db = $this->load->database('default', TRUE);
		$this->load->model("devel/devel_model", "dev");
		if (!$this->input->is_cli_request()) exit('Only CLI access allowed');
    }
    
    public function index(){
        echo "Hello World";
    }

}