<?php
$this->breadcrumbs=array(
	'Active Record Logs',
);

$this->menu=array(
	array('label'=>'Create ActiveRecordLog', 'url'=>array('create')),
	array('label'=>'Manage ActiveRecordLog', 'url'=>array('admin')),
);
?>

<h1>Active Record Logs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
