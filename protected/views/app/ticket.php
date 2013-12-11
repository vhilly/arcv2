<h1>Tickets</h1>
<?php $sc=CHtml::listData(SeatingClass::model()->findAll(),'id','name');?>
<?php $ptype=CHtml::listData(PassengerType::model()->findAll(),'id','name');?>
<?php $voyage=CHtml::listData(Voyage::model()->findAll(array('order'=>'id DESC')),'id','number');?>
<?php $status=CHtml::listData(Status::model()->findAll(array('condition'=>'entity_id = 1')),'id','name');?>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'ticket-grid',
  'dataProvider'=>$ticket->search(),
  'filter'=>$ticket,
  'columns'=>array(
  'ticket_no',
  array('name'=>'series_no',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Ticket')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'voyage','value'=>'$data->voyage0->number','filter'=>$voyage),
  array('name'=>'passenger0.first_name',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Passenger')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'passenger0.last_name',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Passenger')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'passenger0.age',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Passenger')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'passenger_type','value'=>'$data->passengerType->name','filter'=>$ptype),
  array('name'=>'seating_class','value'=>'$data->seatingClass->name','filter'=>$sc),
  array('name'=>'ticket_type','value'=>'$data->ticket_type==1?"Advance":"Walk-in"','filter'=>array(1=>'Advance',2=>'Walk-in')),
  'price_paid',
  array('name'=>'status','value'=>'$data->status0->name','filter'=>$status),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{print}  &nbsp; {refund}  &nbsp; {cancel}',
      'buttons'=>array(            
        'print' => array(
           'label'=>'print',
           'icon'=>'icon-print',
           'url'=>'Yii::app()->createUrl("app/print",array("id"=>"$data->id","type"=>"tkt"))',
            'options'=>array('target'=>'_blank'),
         ),
        'refund' => array(
           'label'=>'refund',
           'icon'=>'icon-share',
           'url'=>'Yii::app()->createUrl("app/ticketRefund",array("id"=>"$data->id"))',
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
           'url'=>'Yii::app()->createUrl("app/ticketCancel",array("id"=>"$data->id"))',
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
