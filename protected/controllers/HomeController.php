<?php

class HomeController extends Controller
{
	
	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'rights', // perform access control for CRUD operations
		);
	}
	
	// Actions públicas
	public function allowedActions()
	{
	 	return 'index, login, logout, error';
	}
	
	// Action Default
	function actionIndex(){
		// Componente para passar mensagens
		//Yii::app()->user->setFlash('sucess',"Cadastrado com sucesso!");
		// Passar variável pra view
		//$vars['view'] = Yii::app()->user->id;
		//$this->render('index', $vars);
		$this->render('index');
	}
	
	// Esta action pega os erros externos
	public function actionError()
	{
	    if($error=Yii::app()->errorHandler->error)
	    {
	    	if(Yii::app()->request->isAjaxRequest)
	    		echo $error['message'];
	    	else
	        	$this->render('error', $error);
	    }
	}
	
	// Action de Login
	public function actionLogin()
	{
		$model=new LoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
				$this->redirect(Yii::app()->user->returnUrl);
		}
		// display the login form
		$this->render('login',array('model'=>$model));
	}
	
	// Action de Logout
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
}