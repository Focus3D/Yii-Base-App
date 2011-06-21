<?php

class User extends CActiveRecord
{
	/**
	 * The followings are the available columns in table 'tbl_user':
	 * @var integer $id
	 * @var string $username
	 * @var string $password
	 * @var string $rpassword
	 * @var string $salt
	 * @var string $email
	 * @var string $profile
	 */
	public $rpassword;
	/**
	 * Returns the static model of the specified AR class.
	 * @return CActiveRecord the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{user}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('username, password, email', 'required'),
			array('username, password, email', 'length', 'max'=>128),
			array('email', 'email'),			
			array('password', 'filter', 'filter'=>array($this, 'transforma'), 'on'=>'insert, update'),
			array('rpassword', 'filter', 'filter'=>array($this, 'transforma'), 'on'=>'insert, update'),
			array('password', 'compare', 'compareAttribute'=>'rpassword', 'on'=>'insert, update'),
			array('id, username, password, hash, email, profile', 'safe', 'on'=>'search'),
			array('email','unique'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			//'posts' => array(self::HAS_MANY, 'Post', 'author_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'username' => 'Usuário',
			'password' => 'Senha',
			'rpassword' => 'Repetir senha',
			'salt' => 'Salt',
			'email' => 'E-mail',
			'profile' => 'Perfil',
		);
	}

	public function search()
	{
		$criteria=new CDbCriteria;
		$criteria->compare('id',$this->id);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('email',$this->email,true);

		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,			
		));
	}
	/**
	 * Checks if the given password is correct.
	 * @param string the password to be validated
	 * @return boolean whether the password is valid
	 */
	public function validatePassword($password)
	{
		return $this->hashPassword($password,$this->salt)===$this->password;
	}

	/**
	 * Generates the password hash.
	 * @param string password
	 * @param string salt
	 * @return string hash
	 */
	public function hashPassword($password,$salt)
	{
		return md5($salt.$password);
	}

	public function transforma($value)
	{
		if(!isset($this->salt))
		{
			$this->salt = $this->generateSalt();
		}
		return $this->hashPassword($value, $this->salt);
	}
	
	/**
	 * Generates a salt that can be used to generate a password hash.
	 * @return string the salt
	 */
	protected function generateSalt()
	{
		return uniqid('',true);
	}
	
	public function behaviors()
	{
	    return array(
		    // Classname => path to Class
		    'ActiveRecordLogableBehavior'=>
		    	'application.behaviors.ActiveRecordLogableBehavior',
	    );
	}
}