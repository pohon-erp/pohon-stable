<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Common_model extends CI_Model{

    public function __construct(){
		parent::__construct();
		$this->db = $this->load->database('default', TRUE);
	}

}