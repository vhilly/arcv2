<h1>Waybills</h1>
<?php $sc=CHtml::listData(CargoClass::model()->findAll(),'id','name');?>
<?php $voyage=CHtml::listData(Voyage::model()->findAll(array('order'=>'id DESC')),'id','voyage_number');?>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'waybill-grid',
  'dataProvider'=>$waybill->search(),
  'filter'=>$waybill,
  'columns'=>array(
  'lading_no',
  array('name'=>'series_no',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Waybill')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'voyage_id','value'=>'$data->voyage->voyage_number','filter'=>$voyage),
  array('name'=>'cargo_class_id','value'=>'$data->cargoClass->name','filter'=>$sc),
  array('name'=>'waybill_type_id','value'=>'$data->waybill_type_id==1?"Advance":"Walk-in"','filter'=>array(1=>'Advance',2=>'Walk-in')),
  'price_paid',
  'status_id',
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{print}  &nbsp; {refund}  &nbsp; {cancel}',
      'buttons'=>array(            
        'print' => array(
           'label'=>'print',
           'icon'=>'icon-print',
           'url'=>'Yii::app()->createUrl("app/print",array("id"=>"$data->id","type"=>"wb"))',
            'options'=>array('target'=>'_blank'),
         ),
        'refund' => array(
           'label'=>'refund',
           'icon'=>'icon-undo',
           'url'=>'Yii::app()->createUrl("app/waybillRefund",array("id"=>"$data->id"))',
           'options'=>array(
             'confirm'=>'Are you sure?',
             'ajax'=>array(
               'type'=>'POST',
               'url'=>"js:$(this).attr('href')",
               'success' => "js:function() { $.fn.yiiGridView.update('ticket-grid') }"
             )
           )
         ),
        'cancel' => array(
           'label'=>'cancel',
           'icon'=>'icon-trash',
           'url'=>'Yii::app()->createUrl("app/waybillCancel",array("id"=>"$data->id"))',
           'options'=>array(
             'confirm'=>'Are you sure?',
             'ajax'=>array(
               'type'=>'POST',
               'url'=>"js:$(this).attr('href')",
               'success' => "js:function() { $.fn.yiiGridView.update('ticket-grid') }"
             )
           )
         ),
      ),
    ),
  ),
)); 

?>
