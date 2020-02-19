<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class Auth
 * @property Ion_auth|Ion_auth_model $ion_auth        The ION Auth spark
 * @property CI_Form_validation      $form_validation The form validation library
 */
class Auth extends MX_Controller {

    public $data = [];

    public function __construct() {
        parent::__construct();
        $this->db = $this->load->database('default', TRUE);
		$this->load->model("auth/role_model", "role");
		$this->load->model("auth/permission_model", "permission");
        $this->load->library(['ion_auth', 'form_validation', 'template', 'session']);
        $this->load->helper(['url', 'language']);

        $this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));

        $this->lang->load('auth');
        $this->template->set_template('layouts/auth');
    }

    /**
     * Redirect if needed, otherwise display the user list
     */
    public function index() {

        if (!$this->ion_auth->logged_in()) {
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        } else {
            $this->data['title'] = $this->lang->line('index_heading');

            // set the flash data error message if there is one
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

            //list the users
            $this->data['users'] = $this->ion_auth->users()->result();

            //USAGE NOTE - you can do more complicated queries like this
            //$this->data['users'] = $this->ion_auth->where('field', 'value')->users()->result();

            foreach ($this->data['users'] as $k => $user) {
                $this->data['users'][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
            }

            $this->_render_page('auth' . DIRECTORY_SEPARATOR . 'index', $this->data);
        }
    }

    /**
     * Log the user in
     */
    public function login() {
        $this->data['title'] = $this->lang->line('login_heading');

        // validate form input
        $this->form_validation->set_rules('identity', str_replace(':', '', $this->lang->line('login_identity_label')), 'required');
		$this->form_validation->set_rules('password', str_replace(':', '', $this->lang->line('login_password_label')), 'required');
		$this->form_validation->set_rules('captcha','Kode captcha','required');

        if ($this->form_validation->run() === TRUE) {

			// check captcha
			$captcha = $this->input->post('captcha');
			$captcha_session = $this->session->userdata('captcha');

			if (slugify($captcha) != slugify($captcha_session)) {
				$this->session->set_flashdata('message', 'Kode captcha salah');
                redirect('auth/login', 'refresh'); 
			}

            // check to see if the user is logging in
            // check for "remember me"
            $remember = (bool) $this->input->post('remember');

            if ($this->ion_auth->login($this->input->post('identity'), $this->input->post('password'), $remember)) {
                //if the login is successful
                //redirect them back to the home page
                $this->session->set_flashdata('message', $this->ion_auth->messages());
                redirect('/', 'refresh');
            } else {
                // if the login was un-successful
                // redirect them back to the login page
                $this->session->set_flashdata('message', $this->ion_auth->errors());
                redirect('auth/login', 'refresh'); // use redirects instead of loading views for compatibility with MY_Controller libraries
            }
        } else {
            // the user is not logging in so display the login page
            // set the flash data error message if there is one
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

            $this->data['identity'] = [
                'name' => 'identity',
                'id' => 'identity',
                'type' => 'text',
                'value' => $this->form_validation->set_value('identity'),
                'class' => 'form-control',
                'placeholder' => "Username atau Email"
            ];

            $this->data['password'] = [
                'name' => 'password',
                'id' => 'password',
                'type' => 'password',
                'class' => 'form-control',
                "placeholder" => "Kata Sandi"
			];
			
			$this->data['captcha'] = [
                'name' => 'captcha',
                'id' => 'captcha',
                'type' => 'text',
                'class' => 'form-control',
                "placeholder" => "Kode Captcha"
			];
			
			

            $this->_render_page('auth' . DIRECTORY_SEPARATOR . 'login', $this->data);
        }
    }

    /**
     * Log the user out
     */
    public function logout() {
        $this->data['title'] = "Logout";

        // log the user out
        $this->ion_auth->logout();

        // redirect them to the login page
        redirect('auth/login', 'refresh');
    }

    /**
     * Change password
     */
    public function change_password() {
        $this->form_validation->set_rules('old', $this->lang->line('change_password_validation_old_password_label'), 'required');
        $this->form_validation->set_rules('new', $this->lang->line('change_password_validation_new_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|matches[new_confirm]');
        $this->form_validation->set_rules('new_confirm', $this->lang->line('change_password_validation_new_password_confirm_label'), 'required');

        if (!$this->ion_auth->logged_in()) {
            redirect('auth/login', 'refresh');
        }

        $user = $this->ion_auth->user()->row();

        if ($this->form_validation->run() === FALSE) {
            // display the form
            // set the flash data error message if there is one
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

            $this->data['min_password_length'] = $this->config->item('min_password_length', 'ion_auth');
            $this->data['old_password'] = [
                'name' => 'old',
                'id' => 'old',
                'type' => 'password',
            ];
            $this->data['new_password'] = [
                'name' => 'new',
                'id' => 'new',
                'type' => 'password',
                'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
            ];
            $this->data['new_password_confirm'] = [
                'name' => 'new_confirm',
                'id' => 'new_confirm',
                'type' => 'password',
                'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
            ];
            $this->data['user_id'] = [
                'name' => 'user_id',
                'id' => 'user_id',
                'type' => 'hidden',
                'value' => $user->id,
            ];

            // render
            $this->_render_page('auth' . DIRECTORY_SEPARATOR . 'change_password', $this->data);
        } else {
            $identity = $this->session->userdata('identity');

            $change = $this->ion_auth->change_password($identity, $this->input->post('old'), $this->input->post('new'));

            if ($change) {
                //if the password was successfully changed
                $this->session->set_flashdata('message', $this->ion_auth->messages());
                $this->logout();
            } else {
                $this->session->set_flashdata('message', $this->ion_auth->errors());
                redirect('auth/change_password', 'refresh');
            }
        }
    }

    /**
     * Forgot password
     */
    public function forgot_password() {
        $this->data['title'] = $this->lang->line('forgot_password_heading');

        // setting validation rules by checking whether identity is username or email
        if ($this->config->item('identity', 'ion_auth') != 'email') {
            $this->form_validation->set_rules('identity', $this->lang->line('forgot_password_identity_label'), 'required');
        } else {
            $this->form_validation->set_rules('identity', $this->lang->line('forgot_password_validation_email_label'), 'required|valid_email');
		}
		
		$this->form_validation->set_rules('captcha','Kode captcha','required');


        if ($this->form_validation->run() === FALSE) {
            $this->data['type'] = $this->config->item('identity', 'ion_auth');
            // setup the input
            $this->data['identity'] = [
                'name' => 'identity',
                'id' => 'identity',
                'class' => 'form-control',
                'placeholder' => 'Alamat email aktif'
			];
			
			$this->data['captcha'] = [
                'name' => 'captcha',
                'id' => 'captcha',
                'type' => 'text',
                'class' => 'form-control',
                "placeholder" => "Kode Captcha"
			];

            if ($this->config->item('identity', 'ion_auth') != 'email') {
                $this->data['identity_label'] = $this->lang->line('forgot_password_identity_label');
            } else {
                $this->data['identity_label'] = $this->lang->line('forgot_password_email_identity_label');
            }

            // set any errors and display the form
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
            $this->_render_page('auth' . DIRECTORY_SEPARATOR . 'forgot_password', $this->data);
        } else {

			// check captcha
			$captcha = $this->input->post('captcha');
			$captcha_session = $this->session->userdata('captcha');

			if (slugify($captcha) != slugify($captcha_session)) {
				$this->session->set_flashdata('message', 'Kode captcha salah');
				redirect('auth/forgot_password', 'refresh'); 
			}


            $identity_column = "email";
            $identity = $this->ion_auth->where($identity_column, $this->input->post('identity'))->users()->row();

            if (empty($identity)) {

                if ($this->config->item('identity', 'ion_auth') != 'email') {
                    $this->ion_auth->set_error('forgot_password_identity_not_found');
                } else {
                    $this->ion_auth->set_error('forgot_password_email_not_found');
                }

                $this->session->set_flashdata('message', $this->ion_auth->errors());
                redirect("auth/forgot_password", 'refresh');
            }

            // run the forgotten password method to email an activation code to the user
            $forgotten = $this->ion_auth->forgotten_password($identity->{$this->config->item('identity', 'ion_auth')});

            if ($forgotten) {
                // if there were no errors
                $this->session->set_flashdata('message', $this->ion_auth->messages());
                redirect("auth/login", 'refresh'); //we should display a confirmation page here instead of the login page
            } else {
                $this->session->set_flashdata('message', $this->ion_auth->errors());
                redirect("auth/forgot_password", 'refresh');
            }
        }
    }

    /**
     * Reset password - final step for forgotten password
     *
     * @param string|null $code The reset code
     */
    public function reset_password($param = NULL) {
        $code = base64_decode($param);
        if (!$code) {
            show_404();
        }

        $this->data['title'] = $this->lang->line('reset_password_heading');

        $user = $this->ion_auth->forgotten_password_check($code);

        if ($user) {
            // if the code is valid then display the password reset form

            $this->form_validation->set_rules('new', $this->lang->line('reset_password_validation_new_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|matches[new_confirm]');
			$this->form_validation->set_rules('new_confirm', $this->lang->line('reset_password_validation_new_password_confirm_label'), 'required');
			$this->form_validation->set_rules('captcha', 'Kode Captcha', 'required');

            if ($this->form_validation->run() === FALSE) {
                // display the form
                // set the flash data error message if there is one
                $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

                $this->data['min_password_length'] = $this->config->item('min_password_length', 'ion_auth');
                $this->data['new_password'] = [
                    'name' => 'new',
                    'id' => 'new',
                    'type' => 'password',
                    'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
                    'class' => 'form-control',
                    'placeholder' => 'Kata Sandi Baru (minimal ' . $this->data['min_password_length'] . ' karakter)'
                ];
                $this->data['new_password_confirm'] = [
                    'name' => 'new_confirm',
                    'id' => 'new_confirm',
                    'type' => 'password',
                    'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
                    'class' => 'form-control',
                    'placeholder' => sprintf(lang('reset_password_new_password_confirm_label'), 'new_password_confirm')
                ];
                $this->data['user_id'] = [
                    'name' => 'user_id',
                    'id' => 'user_id',
                    'type' => 'hidden',
                    'value' => $user->id,
                    'class' => 'form-control'
				];
				$this->data['captcha'] = [
					'name' => 'captcha',
					'id' => 'captcha',
					'type' => 'text',
					'class' => 'form-control',
					"placeholder" => "Kode Captcha"
				];
                $this->data['csrf'] = $this->_get_csrf_nonce();
                $this->data['code'] = $code;

                // render
                $this->_render_page('auth' . DIRECTORY_SEPARATOR . 'reset_password', $this->data);
            } else {
				$identity = $user->{$this->config->item('identity', 'ion_auth')};
				
				// check captcha
				$captcha = $this->input->post('captcha');
				$captcha_session = $this->session->userdata('captcha');

				if (slugify($captcha) != slugify($captcha_session)) {
					$this->session->set_flashdata('message', 'Kode captcha salah');
					redirect('auth/reset_password/' . $param, 'refresh');
				}

                // do we have a valid request?
                if ($this->_valid_csrf_nonce() === FALSE || $user->id != $this->input->post('user_id')) {

                    // something fishy might be up
                    $this->ion_auth->clear_forgotten_password_code($identity);

                    show_error($this->lang->line('error_csrf'));
                } else {
                    // finally change the password
                    $change = $this->ion_auth->reset_password($identity, $this->input->post('new'));

                    if ($change) {
                        // if the password was successfully changed
                        $this->session->set_flashdata('message', $this->ion_auth->messages());
                        redirect("auth/login", 'refresh');
                    } else {
                        $this->session->set_flashdata('message', $this->ion_auth->errors());
                        redirect('auth/reset_password/' . $param, 'refresh');
                    }
                }
            }
        } else {
            // if the code is invalid then send them back to the forgot password page
            $this->session->set_flashdata('message', $this->ion_auth->errors());
            redirect("auth/forgot_password", 'refresh');
        }
    }

    /**
     * Activate the user
     *
     * @param int         $id   The user ID
     * @param string|bool $code The activation code
     */
    public function activate($id, $param = FALSE) {
        $activation = FALSE;
        $code = base64_decode($param);

        if ($code !== FALSE) {
            $activation = $this->ion_auth->activate($id, $code);
        } else if ($this->ion_auth->is_admin()) {
            $activation = $this->ion_auth->activate($id);
        }

        if ($activation) {
            // redirect them to the auth page
            $this->session->set_flashdata('message', $this->ion_auth->messages());
            redirect("auth", 'refresh');
        } else {
            // redirect them to the forgot password page
            $this->session->set_flashdata('message', $this->ion_auth->errors());
            redirect("auth/forgot_password", 'refresh');
        }
    }

    /**
     * Redirect a user checking if is admin
     */
    public function redirectUser() {
        if ($this->ion_auth->is_admin()) {
            redirect('auth', 'refresh');
        }
        redirect('/', 'refresh');
    }

    public function register() {

        $this->data['title'] = $this->lang->line('create_user_heading');

        $roles = $this->role->getDefaultRole();
        $tables = $this->config->item('tables', 'ion_auth');
        $identity_column = $this->config->item('identity', 'ion_auth');
        $this->data['identity_column'] = $identity_column;

        // validate form input
        if ($identity_column !== 'email') {
            $this->form_validation->set_rules('identity', $this->lang->line('create_user_validation_identity_label'), 'trim|required|is_unique[' . $tables['users'] . '.' . $identity_column . ']');
            $this->form_validation->set_rules('email', $this->lang->line('create_user_validation_email_label'), 'trim|required|valid_email');
        } else {
            $this->form_validation->set_rules('email', $this->lang->line('create_user_validation_email_label'), 'trim|required|valid_email|is_unique[' . $tables['users'] . '.email]');
        }

        $this->form_validation->set_rules('password', $this->lang->line('create_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|matches[password_confirm]');
		$this->form_validation->set_rules('password_confirm', $this->lang->line('create_user_validation_password_confirm_label'), 'required');
		$this->form_validation->set_rules('captcha', 'Kode Captcha', 'required');

        if ($this->form_validation->run() === TRUE) {

			// check captcha
			$captcha = $this->input->post('captcha');
			$captcha_session = $this->session->userdata('captcha');

			if (slugify($captcha) != slugify($captcha_session)) {
				$this->session->set_flashdata('message', 'Kode captcha salah');
				redirect('auth/register', 'refresh');
			}

            $email = strtolower($this->input->post('email'));
            $identity = ($identity_column === 'email') ? $email : $this->input->post('identity');
            $password = $this->input->post('password');
        }
        if ($this->form_validation->run() === TRUE && $this->ion_auth->register($identity, $password, $email, array(), $roles)) {
            // check to see if we are creating the user
            // redirect them back to the admin page
            $this->session->set_flashdata('message', $this->ion_auth->messages());
            redirect("auth/login", 'refresh');
        } else {
            // display the create user form
            // set the flash data error message if there is one
            $this->data['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));

            $this->data['identity'] = [
                'name' => 'identity',
                'id' => 'identity',
                'type' => 'text',
                'value' => $this->form_validation->set_value('identity'),
                'class' => 'form-control',
                'placeholder' => 'Username'
            ];
            $this->data['email'] = [
                'name' => 'email',
                'id' => 'email',
                'type' => 'email',
                'value' => $this->form_validation->set_value('email'),
                'class' => 'form-control',
                'placeholder' => 'Email'
            ];
            $this->data['password'] = [
                'name' => 'password',
                'id' => 'password',
                'type' => 'password',
                'value' => $this->form_validation->set_value('password'),
                'class' => 'form-control',
                'placeholder' => 'Kata sandi'
            ];
            $this->data['password_confirm'] = [
                'name' => 'password_confirm',
                'id' => 'password_confirm',
                'type' => 'password',
                'value' => $this->form_validation->set_value('password_confirm'),
                'class' => 'form-control',
                'placeholder' => 'Konfirmasi kata sandi'
			];
			$this->data['captcha'] = [
				'name' => 'captcha',
				'id' => 'captcha',
				'type' => 'text',
				'class' => 'form-control',
				"placeholder" => "Kode Captcha"
			];

            $this->_render_page('auth' . DIRECTORY_SEPARATOR . 'register', $this->data);
        }
    }

    /**
     * @return array A CSRF key-value pair
     */
    public function _get_csrf_nonce() {
        $this->load->helper('string');
        $key = random_string('alnum', 8);
        $value = random_string('alnum', 20);
        $this->session->set_flashdata('csrfkey', $key);
        $this->session->set_flashdata('csrfvalue', $value);

        return [$key => $value];
    }

    /**
     * @return bool Whether the posted CSRF token matches
     */
    public function _valid_csrf_nonce() {
        $csrfkey = $this->input->post($this->session->flashdata('csrfkey'));
        if ($csrfkey && $csrfkey === $this->session->flashdata('csrfvalue')) {
            return TRUE;
        }
        return FALSE;
    }

    /**
     * @param string     $view
     * @param array|null $data
     * @param bool       $returnhtml
     *
     * @return mixed
     */
    public function _render_page($view, $data = NULL, $returnhtml = FALSE) {//I think this makes more sense
        if ($this->ion_auth->logged_in()) {
			$homeUrl = $this->permission->getHomeUrl();
            redirect($homeUrl, 'refresh');
        } else {

			if (!is_dir(FCPATH.'captcha')) {
				mkdir(FCPATH.'captcha', '0777', true);
			}

			$config = array(
				'img_url' => base_url('captcha/'),
				'img_path' => FCPATH.'captcha/',
				'img_height' => 45,
				'word_length' => 6,
				'img_width' => '200',
				'font_size' => 20,
				'font_path'=> FCPATH."assets/plugins/Roboto-Black.ttf"
			);

			$captcha_new = create_captcha($config);
			unset($_SESSION['captcha']);
			$this->session->set_userdata('captcha', $captcha_new['word']);
			$data['captchaImage'] = $captcha_new['image'];

            $viewdata = (empty($data)) ? $this->data : $data;
            $this->template->title = $viewdata["title"];
            $this->template->content->view($view, $viewdata, $returnhtml);
            $this->template->publish();
        }
	}
	
	public function captcha_refresh() {
        $config = array(
            'img_url' => base_url('captcha/'),
			'img_path' => FCPATH.'captcha/',
            'img_height' => 45,
            'word_length' => 6,
            'img_width' => '200',
			'font_size' => 20,
			'font_path'=> FCPATH."assets/plugins/Roboto-Black.ttf"
        );
        $captcha_new = create_captcha($config);
        unset($_SESSION['captcha']);
        $this->session->set_userdata('captcha', $captcha_new['word']);
        echo $captcha_new['image'];
    }

}
