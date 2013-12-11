<?php
$this->breadcrumbs=array(
	'Baggage Types'=>array('index'),
	$model->id,
);

$this->menu=array(
array('label'=>'List BaggageType','url'=>array('index')),
array('label'=>'Create BaggageType','url'=>array('create')),
array('label'=>'Update BaggageType','url'=>array('update','id'=>$model->id)),
array('label'=>'Delete BaggageType','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Manage BaggageType','url'=>array('admin')),
);
?>

<h1>View BaggageType #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id',
		'weight',
		'description',
		'price',
		'active',
),
)); ?>
