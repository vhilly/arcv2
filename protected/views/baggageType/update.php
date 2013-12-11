<?php
$this->breadcrumbs=array(
	'Baggage Types'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

	$this->menu=array(
	array('label'=>'List BaggageType','url'=>array('index')),
	array('label'=>'Create BaggageType','url'=>array('create')),
	array('label'=>'View BaggageType','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage BaggageType','url'=>array('admin')),
	);
	?>

	<h1>Update BaggageType <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>