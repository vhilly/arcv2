<h1>Ports</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'vessel-grid',
  'dataProvider'=>$port->search(),
  'filter'=>$port,
  'columns'=>array(
  'name',
  'code',
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/portUpdate",array("id"=>"$data->id"))',
         ),
      ),
    ),
  ),
)); 

?>
<?php 
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/portAdd'),'label'=>Yii::t('app','label.port.add')));
?>
