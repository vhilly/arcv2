<h1>Tickets</h1>
<?php $sc=CHtml::listData(SeatingClass::model()->findAll(),'id','name');?>
<?php $ptype=CHtml::listData(PassengerType::model()->findAll(),'id','name');?>
<?php $voyage=CHtml::listData(Voyage::model()->findAll(array('order'=>'id DESC')),'id','voyage_number');?>

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
  array('name'=>'voyage_id','value'=>'$data->voyage->voyage_number','filter'=>$voyage),
  array('name'=>'passenger.first_name',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Passenger')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'passenger.last_name',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Passenger')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'passenger.age',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Passenger')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'passenger_type_id','value'=>'$data->passengerType->name','filter'=>$ptype),
  array('name'=>'seating_class_id','value'=>'$data->seatingClass->name','filter'=>$sc),
  array('name'=>'ticket_type_id','value'=>'$data->ticket_type_id==1?"Advance":"Walk-in"','filter'=>array(1=>'Advance',2=>'Walk-in')),
  'price_paid',
  'status_id',
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
           'icon'=>'icon-undo',
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
           'label'=>'refund',
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
