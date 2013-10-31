<style>
  .seatBlock {
    border-collapse:collapse;
  }
  .seatBlock th,
  .seatBlock td {
    border:1px solid black;
    width:30px;
    height:30px;
    text-align:center;
	padding:0;
  }
  td.space {
    border-right:0px solid transparent;
    border-left:0px solid transparent;
    border-top:0px solid transparent;
    border-bottom:0px solid transparent;
  }
  .color {
    background:#3af;
  }
</style>
<?php
  $pl = array();
  $sp = array();
  foreach($class as $bl){
    $pl[$bl['id']]['id'] = $bl['id'];
	$pl[$bl['id']]['name'] = $bl['name'];
	$pl[$bl['id']]['rows'] = $bl['rows'];
	$pl[$bl['id']]['cols'] = $bl['cols'];
  }
  foreach($list as $st){
    $sp[$st['y']][$st['x']][$st['seating_class']]['name'] = $st['name'];
	$sp[$st['y']][$st['x']][$st['seating_class']]['id'] = $st['id'];
    $sp[$st['y']][$st['x']][$st['seating_class']]['class'] = $st['seating_class'];
  }
  foreach($pl as $cls){
    $x = $cls['cols'];
	$y = $cls['rows'];
    $z = $cls['id'];
    $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
      'title' => $cls['name'],
      'headerIcon' => 'icon-th-list',
      'htmlOptions' => array('class'=>'seat_avail')
    ));


    $body = "<table class=\"seatBlock\" align=center>";

    for($i=1;$i<=$y;$i++){
      $body .="<tr>";
      for($j=1;$j<=$x;$j++){
	    $text = isset($sp[$i][$j][$z]['class']) ? ($sp[$i][$j][$z]['class']==$cls['id']) ? $sp[$i][$j][$z]['name'] : "" : "";
		$id = isset($sp[$i][$j][$z]['class']) ? ($sp[$i][$j][$z]['class']==$cls['id']) ? $sp[$i][$j][$z]['id'] : 0 : 0;
	    $color = $text!="" ? "color" : "";
        $body .= "<td a={$id} x={$j} y={$i} z={$cls['id']} class=\"seatMap {$color}\">{$text}</td>";
      }
      $body .="</tr>";
    }
    $body .= "</table>";
    echo $body;
    $this->endWidget();		
  }


?>


<?php $this->beginWidget('bootstrap.widgets.TbModal', array('id'=>'seatModal')); ?>
  <div class="modal-header">
  </div>
  <div class="modal-body" align=center>
    <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
      'id'=>'inlineForm',
      'type'=>'inline',
      'htmlOptions'=>array('class'=>'well'),
     )); ?>
    <!--<input type="hidden" id="ids" name="ids" value=0>-->
    <?php echo $form->hiddenField($model,'id')?>
    <?php echo $form->hiddenField($model,'x')?>
    <?php echo $form->hiddenField($model,'y')?>
	<?php echo $form->hiddenField($model,'seating_class')?>
    <?php echo $form->textFieldRow($model,'name')?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'info','buttonType'=>'submit', 'label'=>'Add','htmlOptions'=>array('id'=>'submit','onclick'=>'return confirm("Are you sure?");'))); ?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'error','buttonType'=>'submit', 'label'=>'Remove','htmlOptions'=>array('name'=>'remove','id'=>'remove','onclick'=>'return confirm("Are you sure?");'))); ?>
 
   <?php $this->endWidget(); ?>
  
  </div>
  <div class="modal-footer">

    <?php $this->widget('bootstrap.widgets.TbButton', array(
      'label'=>'Close',
      'url'=>'#',
      'htmlOptions'=>array('data-dismiss'=>'modal'),
    )); ?>
  </div>
<?php $this->endWidget(); ?>
<script>

 $('.seatMap').click(
   function(){
      //$('#seatModal .modal-body p').html($(this).text());
	  var seat = $(this).text();
      $('#Seat_name').val('');
	  if(seat){
		$('#Seat_id').val($(this).attr('a'));
		$('#remove').css('display','');
		$('#Seat_name').val(seat);
	    $('#submit').html('Update');
		}else{
		$('#Seat_id').val('');
		$('#remove').css('display','none');
	    $('#submit').html('Add');
	  }
      $('#seatModal').modal();
      $('#Seat_x').val($(this).attr('x'));
      $('#Seat_y').val($(this).attr('y'));
      $('#Seat_seating_class').val($(this).attr('z'));
      $('#selectedSeat').html(seat);
   }
 );

</script>

