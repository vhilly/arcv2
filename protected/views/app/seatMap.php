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
  .seated {
    background:#fc0;
  }
  #no-seated:hover {
    background:#efc;
  }
  .color {
    background:#3af;
  }
</style>
<?php
  $seated = array();
  $values = Array();
 // print_r($query);die();
  foreach($list as $q){
    $values['x'][] = $q->x;
    $values['y'][] = $q->y;
    $values['name'][$q->y][$q->x] = $q->name;
    $values['id'][$q->y][$q->x] = $q->id;
  } 
  foreach($bookedSeats as $s){
    $seated[$s->seat0->y][$s->seat0->x] = $s->seat;
  }
 // echo "<pre>";
  //print_r($seated);
  //echo "</pre>";
//die();
  $x = isset($values['x']) ? max($values['x']) : 0;
  $y = isset($values['y']) ? max($values['y']) : 0;  
  $body = "";

  for($i=1;$i<=$y;$i++){
    $body .="<tr>";
    for($j=1;$j<=$x;$j++){
      $spacer = "space";
      $text = "";
      if(isset($values['name'][$i][$j])){
        $spacer = !$values['name'][$i][$j] ? "space" : "";
        $text = $spacer=="space" ? "" : $values['name'][$i][$j];
		$setID = $values['id'][$i][$j];
      }
	  $set = isset($seated[$i][$j]) ? "seated" : "seatMap";
	  $blk = ($spacer=="space" || $set!="") ? "" : "no-seated";
      $body .= "<td id=\"$blk\" class=\"$spacer $set\" a={$setID}>{$text}</td>";
    }
    $body .="</tr>";
  }

?>
<h5 align=center><?=$class->name?></h5>
<table class="seatBlock" align=center>
  <?=$body?>
</table>
<?php
/*
//echo "Transfer";die();
  $pl = array();
  $sp = array();
  foreach($class as $bl){
    $pl[$bl['id']]['id'] = $bl['id'];
	$pl[$bl['id']]['name'] = $bl['name'];
	$pl[$bl['id']]['rows'] = $bl['rows'];
	$pl[$bl['id']]['cols'] = $bl['cols'];
  }
  foreach($list as $st){
    $sp[$st['y']][$st['x']]['name'] = $st['name'];
	$sp[$st['y']][$st['x']]['id'] = $st['id'];
    $sp[$st['y']][$st['x']]['class'] = $st['seating_class'];
  }
  foreach($pl as $cls){
    $x = $cls['cols'];
	$y = $cls['rows'];

    $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
      'title' => $cls['name'],
      'headerIcon' => 'icon-th-list',
      'htmlOptions' => array('class'=>'seat_avail')
    ));


    $body = "<table class=\"seatBlock\" align=center>";

    for($i=1;$i<=$y;$i++){
      $body .="<tr>";
      for($j=1;$j<=$x;$j++){
	    $text = isset($sp[$i][$j]['class']) ? ($sp[$i][$j]['class']==$cls['id']) ? $sp[$i][$j]['name'] : "" : "";
		$id = isset($sp[$i][$j]['class']) ? ($sp[$i][$j]['class']==$cls['id']) ? $sp[$i][$j]['id'] : 0 : 0;
	    $color = $text!="" ? "color" : "";
        $body .= "<td a={$id} x={$j} y={$i} z={$cls['id']} class=\"seatMap {$color}\">{$text}</td>";
      }
      $body .="</tr>";
    }
    $body .= "</table>";
    echo $body;
    $this->endWidget();		
  }
*/

?>

<script>

 $('.seatMap').click(
   function(){
	$('#seatValue').html(this.innerHTML);
	$('#Ticket_seat').val($(this).attr('a'));
   }
 );

</script>

<?php die(); ?>
