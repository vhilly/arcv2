<style>
div.italic {font-style:italic;}
div.bl {font-style:Bold;} 
div.condensed {font-style:condensed;}
div.normal {font-style:normal;}

#ub1{
	font-family:"Ubuntu";
	font-style:"Bold";
	font-size:8pt;
	
} 
#ub2{
	font-family:"Ubuntu";
	text-align:justify;
	font-size:14pt;
}
#ub3{
	font-family:"Ubuntu";
	font-size:6pt;
	text-align:justify;

}
#ub4{
	font-family:"Ubuntu";
	
	font-size:16pt;
}
#ub5{
	font-family:"Ubuntu";
	font-style:"italic";
	font-size:24pt;
}
#ub6{
	font-family:"Times New Roman";
	font-size:24pt;
}
#ub7{
	font-family:"Arial";
	font-size:12pt;
}
.seats {
  padding:5px;
}
</style>

<?php if(!isset($print)):?>

<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
  'id'=>'searchForm',
  'type'=>'search',
  'method'=>'get',
  'htmlOptions'=>array('class'=>'well'),
)); ?>
<?php
  echo $form->textFieldRow($ticket, 'ticket_no',
array('class'=>'input-large','id'=>'tkt_no','prepend'=>'<i class="icon-search"></i>'));
  echo $form->dropDownListRow($ticket,'voyage_id',CHtml::listData(Voyage::model()->findAll(array('condition'=>"departure_date=CURDATE() AND voyage_status_id < 3 ORDER BY id desc")),'id','voyage_number'));
?>
<?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'label'=>'Go')); ?>
<br>
<br>
    <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
    'title' => 'Passenger List',
    'headerIcon' => 'icon-th-list',
    // when displaying a table, if we include bootstra-widget-table class
    // the table will be 0-padding to the box
    'htmlOptions' => array('class'=>'bootstrap-widget-table')
    ));?>
      <?php if($pass):?>
    <table class=table>
          <tr>
	
            <th>Ticket Number</th>
            <th>First Name</th>
            <th>Last Name</th>
          </tr>
        <?php foreach($pass as $key=>$p):?>
          <tr>
            <td><?=$p->ticket_no?></td>
            <td><?=$p->passenger->first_name?></td>
            <td><?=$p->passenger->last_name?></td>
	    <td><?=$p->seat_id?></td>
	    <td><?=$p->voyage->voyage_number?></td>
          </tr>
        <?php endforeach?>
    </table>
    <?php $this->widget('bootstrap.widgets.TbButton', array('label'=>'Check-In and Print Boarding Pass','type'=>'info','buttonType'=>'link','url'=>Yii::app()->createUrl('app/checkin',array('success'=>true)),'icon'=>'icon-print','htmlOptions'=>array('name'=>'print','class'=>'ticket_print_box','width'=>'' ,
      'onclick'=>'window.open("'.Yii::app()->createUrl('app/checkin',array('tns'=>$tns,'print'=>1)).'");this.submit();')))
    ?>
    <?php endif;?>

    <?php $this->endWidget(); ?>
    <?php $this->endWidget();?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'','url'=>Yii::app()->createUrl('app/checkin'),'label'=>'Walk-In'));?>
<?php else:?>
      <script>
        //window.print();
      </script>
      <?php if($pass):?>
        <?php foreach($pass as $key=>$p):?>
        <?php for($i=1;$i<=2;$i++){?>
	<?php
	$dt=$p->voyage->departure_date;
	$dt=date("d F Y",strtotime($dt));
	
	$da=$p->voyage->departure_time;
	$da=date("g:i a", strtotime($da));

	$aa=$p->voyage->arrival_time;
        $aa=date("g:i a", strtotime($aa));



        $arv=$p->voyage->departure_date." ".$p->voyage->departure_time."-".$p->voyage->arrival_time; 
	$ot=$dt." ".$da."-".$aa;
	?>
        <br>
 	<div id="ub1"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FastCat Boarding Pass</b></div>
  	<div id="ub2" class="condensed"><?=$p->passenger->first_name?> <?=$p->passenger->last_name?></div>
	<div id="ub2"><?=$p->voyage->voyage_number?></div>
	<div id="ub3" ><?=$p->voyage->route->name?></div>
        <div id="ub3" class="normal" ><?=$ot?></div>         
	 <?php $cl=$p->seatingClass->name;
        //echo $cl;
        if($p->seating_class_id==1){
        //echo "Yes!";
        echo '<div class="bl" id="ub4" ><i>&nbsp;&nbsp;<u>'.$cl.'</u></i></div>';
        echo ' <div id="ub5" class="italic seats">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b></b></div>';
        #echo ' <div id="ub5" class="italic seats">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>';

        }
        else{
         echo '<div class="bl" id="ub7"><b>&nbsp;&nbsp;'.$cl.'</b></div>';
         echo ' <div id="ub6" class="seats">&nbsp;&nbsp;&nbsp;&nbsp;<b></b></div>';
        #echo ' <div id="ub6" class="seats">&nbsp;&nbsp;&nbsp;&nbsp;</div>';
        }
        ?>

	  <div id="ub1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ticket No:<?=$p->ticket_no?></div>
        <div style="border-top:1px dashed black;width:100%"></div>
	  <div style="height:20px"></div>
        <!-- end -->
        <?php }?>
        <br>
        <?php endforeach?>
    <script>window.print();window.close();</script>
    <?php endif;?>
<?php endif;?>
<script>
  $('#tkt_no').focus();
</script>
