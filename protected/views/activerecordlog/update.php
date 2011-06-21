<?php
$this->breadcrumbs=array(
	'Active Record Logs'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List ActiveRecordLog', 'url'=>array('index')),
	array('label'=>'Create ActiveRecordLog', 'url'=>array('create')),
	array('label'=>'View ActiveRecordLog', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage ActiveRecordLog', 'url'=>array('admin')),
);
?>

<h1>Update ActiveRecordLog <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>