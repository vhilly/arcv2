<?php
$this->breadcrumbs=array(
	'Baggage Types',
);

$this->menu=array(
array('label'=>'Create BaggageType','url'=>array('create')),
array('label'=>'Manage BaggageType','url'=>array('admin')),
);
?>

<h1>Baggage Types</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
