<?php
$this->breadcrumbs=array(
	'Baggage Types'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List BaggageType','url'=>array('index')),
array('label'=>'Manage BaggageType','url'=>array('admin')),
);
?>

<h1>Create BaggageType</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>