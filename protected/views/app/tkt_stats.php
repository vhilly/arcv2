<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/styles.css" />
<?php if($tkts):?>
<?php
 $tkt_details=array();
 $total_amt=0;
 $perclass=array();
 $classes=CHtml::listData(SeatingClass::model()->findAll(array('condition'=>'active=1')),'id','code');
?>
<?php 
   foreach($tkts as $t){
     array_push($tkt_details,CHtml::link($classes[$t->seating_class_id].' '.$t->ticket_no.' '.$t->price_paid.' <span class=side-print>print</span>',
       array('app/print','id'=>$t->id,'type'=>'tkt'),array('target'=>'_blank')));
     @$cnt_perclass['cnt'][$t->seating_class_id]+=1;
     @$cnt_perclass['amt'][$t->seating_class_id]+=$t->price_paid;
     $total_amt+=$t->price_paid;
   }
?>
<div class="block">
	<div class="block-head">
		<div>Total Passenger <span class="badge"><?=count($tkts)?></span></div>
		<div>Total Amount <span><?=number_format($total_amt)?></span></div>
		<?php
			foreach($cnt_perclass['cnt'] as $k=>$v){
				echo '<div>'.$classes[$k].' <span>'.$v.'</span></div>';
			}
			foreach($cnt_perclass['amt'] as $k=>$v){
				echo '<div>'.$classes[$k].' <span>'.$v.'</span></div>';
			}
		?>
	</div>
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
