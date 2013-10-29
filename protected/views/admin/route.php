<h1>Routes</h1>
<?php $ports=CHtml::listData(Port::model()->findAll(),'id','name');?>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'route-grid',
  'dataProvider'=>$route->search(),
  'filter'=>$route,
  'columns'=>array(
  'name',
  array('name'=>'source_port','filter'=>$ports,'value'=>'$data->sourcePort->name'),
  array('name'=>'dest_port','filter'=>$ports,'value'=>'$data->destPort->name'),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/routeUpdate",array("id"=>"$data->id"))',
         ),
      ),
    ),
  ),
)); 

?>
<?php 
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/routeAdd'),'label'=>Yii::t('app','label.route.add')));
?>
