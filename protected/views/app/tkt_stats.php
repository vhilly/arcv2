<?php if($tkts):?>
<?php
 $tkt_details=array();
 $total_amt=0;
 $perclass=array();
 $classes=CHtml::listData(SeatingClass::model()->findAll(array('condition'=>'active=1')),'id','code');
?>
<?php 
   foreach($tkts as $t){
     array_push($tkt_details,CHtml::link($classes[$t->seating_class_id].'-'.$t->passengerType->code.' | TKT#'.$t->ticket_no.' | P'.$t->price_paid.'
       <span class=side-print><i class="icon-print"></i></span>',
       array('app/print','id'=>$t->id,'type'=>'tkt'),array('target'=>'_blank')));
     @$cnt_perclass['cnt'][$t->seating_class_id]+=1;
     @$cnt_perclass['amt'][$t->seating_class_id]+=$t->price_paid;
     $total_amt+=$t->price_paid;
   }
?>
<div class="block side-space ">
  <table class='table'>
    <tr>
      <th class=''> TOTAL PASSENGER:</th>
      <th class=''><?=count($tkts)?></th>
    </tr>
    <tr>
      <th>
      <?php foreach($cnt_perclass['cnt'] as $k=>$v):?>
        <?=$classes[$k]?> <?=$v?>
      <?php endforeach;?>
      <th>
    </tr>
    <tr>
      <th class=''> TOTAL REVENUE:</th>
      <th class=''><?=number_format($total_amt)?></th>
    </tr>
    <tr>
      <th>
      <?php foreach($cnt_perclass['amt'] as $k=>$v):?>
        <?=$classes[$k]?> <?=$v?>
      <?php endforeach;?>
      </th>
    </tr>
  </table>
  <ul class="menu-list">
  <?php
    echo '<li>'.implode('</li><li>',$tkt_details);
  ?>
 </ul>
</div>
<?php 
/*
  echo 'Total Passenger: '.count($tkts).'<br>';
  echo 'Total Amount: '.number_format($total_amt).'<br>';
  foreach($cnt_perclass['cnt'] as $k=>$v){
   echo $classes[$k].':'.$v.'<br>';
  }
  foreach($cnt_perclass['amt'] as $k=>$v){
   echo $classes[$k].':'.number_format($v).'<br>';
  }
  echo implode('<br>',$tkt_details);
 */
?>
<?php endif;?>
