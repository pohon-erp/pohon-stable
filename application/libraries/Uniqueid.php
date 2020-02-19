<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once FCPATH.'vendor/autoload.php';

use Ramsey\Uuid\Uuid;
use Ramsey\Uuid\Exception\UnsatisfiedDependencyException;

class Uniqueid{

	public function __construct() {
		$this->CI =& get_instance();
	}

	public function generate($type = 1){
		try{
			switch($type){
				case 1 :
					$uuid1 = Uuid::uuid1();
					return $uuid1->toString();
					break;
				case 3 :
					$uuid3 = Uuid::uuid3(Uuid::NAMESPACE_DNS, 'php.net');
					return  $uuid3->toString();
					break;
				case 4 :
					$uuid4 = Uuid::uuid4();
					return $uuid4->toString();
					break;
				case 5 :
					$uuid5 = Uuid::uuid5(Uuid::NAMESPACE_DNS, 'php.net');
					return $uuid5->toString();
					break;
				default: 
					$uuid1 = Uuid::uuid1();
					return $uuid1->toString();
					break;
			}
		}catch(UnsatisfiedDependencyException $e){
			return 'Caught exception: ' . $e->getMessage() . "\n";
		}
	}

}
