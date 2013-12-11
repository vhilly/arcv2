<h1>Baggage Types</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'baggage-type-grid',
  'dataProvider'=>$bt->search(),
  'filter'=>$bt,
  'columns'=>array(
  'weight',
  'description',
  'price',
  array('name'=>'active','value'=>'$data->active ==1 ? "Yes":"No"'),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/baggagetypeUpdate",array("id"=>"$data->id"))',
        ),
      ),
    ),
  ),
)); 

?>
<?php
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/baggagetypeAdd'),'label'=>Yii::t('app','label.baggagetype.add')));
?>

