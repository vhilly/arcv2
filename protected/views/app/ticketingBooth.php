<?php $box = $this->beginWidget(
  'bootstrap.widgets.TbBox',
  array(
    'title'=>'Ticketing Booth',
    'headerIcon' => 'icon-ticket ',
    'htmlOptions' => array('class' => 'bootstrap-widget-table span')
  )
);?>

<iframe frameborder="0" id=ticketWindow src='<?=Yii::app()->createUrl('app/passengerTicket',compact('vid'))?>' width=850 height=400>
</iframe>
<?php $this->endWidget(); ?>
<script>
  var frameBody = $("#ticketWindow")[0];
  frameBody.contentWindow.focus();
</script>
