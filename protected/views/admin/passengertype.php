<h1>Passenger Types</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'sc-grid',
  'dataProvider'=>$pt->search(),
  'filter'=>$pt,
  'columns'=>array(
  'name',
  'code',
  'description',
  array('name'=>'active','value'=>'$data->active ==1 ? "Yes":"No"'),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/passengertypeUpdate",array("id"=>"$data->id"))',
         ),
      ),
    ),
  ),
)); 

?>
<?php 
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/passengertypeAdd'),'label'=>Yii::t('app','label.passengertype.add')));
?>
