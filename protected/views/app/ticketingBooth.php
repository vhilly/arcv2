<?php $box = $this->beginWidget(
  'bootstrap.widgets.TbBox',
  array(
    'title'=>'Ticketing Booth',
    'headerIcon' => 'icon-ticket ',
    'htmlOptions' => array('class' => 'bootstrap-widget-table span booth-screen')
  )
);?>

<iframe frameborder="0" id=ticketWindow src='<?=Yii::app()->createUrl('app/passengerTicket',compact('vid'))?>' width=850 >
</iframe>
<?php $this->endWidget(); ?>
<script>
  var frameBody = $("#ticketWindow")[0];
  frameBody.contentWindow.focus();
</script>
