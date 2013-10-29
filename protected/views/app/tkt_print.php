  <script>
    window.print();
    window.close();
  </script>
  <style>
    div {
      font-size:10px;
    }
    .aright{
      text-align:right;
    }
  </style>
  <body>
   <div style="clear:both"> </div><br>
   <?php foreach($result as $key=>$b):?>
   <?php if($key>0):?>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <br><br>
   <?php endif;?>
   <?php $amt = $b->price_paid?>
   <?php $NS = number_format($amt / 1.12,2)?>
   <?php $VAT = number_format($NS * 0.12 ,2)?>
   <?php
     $user = Yii::app()->user->getUserByName(Yii::app()->user->name);
     $createdBy = isset($user) ? $user->profile->firstname.' '.$user->profile->lastname:'';
   ?>
   <?php 
     $left_x = '';
     $left_x1 = '178px';
   ?>
   <table height=140px; width=980px;>
     <tr>
       <td>
   <div style="position:relative;height:150px;width:560px;">
   <div style="position:absolute;height:140px;width:280px;left:60px;top:35px">
     <div style="position:absolute;top:5px;"><?=$b->voyage->vessel->name?></div>
     <div style=position:absolute;top:5px;left:<?=$left_x1?>><?=$b->voyage->voyage_number?></div>
     <div style=position:absolute;top:25px;left:<?=$left_x?>><?=$b->voyage->departure_date.' '.date('g:i A',strtotime($b->voyage->departure_time))?></div>
     <div style=position:absolute;top:25px;left:<?=$left_x1?>></div>
     <div style=position:absolute;top:50px;><?=$b->passenger->first_name?> <?=$b->passenger->last_name?></div>
     <div style=position:absolute;top:70px;><?=$b->passenger->contact?></div>
     <div style=position:absolute;top:95px;left:<?=$left_x?>>Net Sales &nbsp;<?=$NS?></div>
     <div style=position:absolute;top:95px;left:<?=$left_x1?>>VAT (12%) &nbsp;<?=$VAT?></div>
     <div style=position:absolute;top:113px;left:<?=$left_x?>>Discount:0.00</div>
     <div style=position:absolute;top:133px;left:<?=$left_x?>><b><?=isset($amt) ? $amt : '0.00'?></b></div>
     <div style=position:absolute;top:153px;left:<?=$left_x?>><b><?=isset($b->seatingClass->name) ? $b->seatingClass->name : ''?></b></div>
     <div style=position:absolute;top:50px;left:115px><img src='<?=Yii::app()->createUrl('barcodeGenerator/generateBarcode',array('code'=>$b->ticket_no))?>'></div>
     <div style=position:absolute;top:128px;left:<?=$left_x1?>><b><?=$createdBy?></b></div>
   </div>
   <div style="position:absolute;height:140px;width:280px;left:390px;top:35px">
     <div style="position:absolute;top:5px;"><?=$b->voyage->vessel->name?></div>
     <div style=position:absolute;top:5px;left:<?=$left_x1?>><?=$b->voyage->voyage_number?></div>
     <div style=position:absolute;top:25px;left:<?=$left_x?>><?=$b->voyage->departure_date.' '.date('g:i A',strtotime($b->voyage->departure_time))?></div>
     <div style=position:absolute;top:25px;left:<?=$left_x1?>></div>
     <div style=position:absolute;top:50px;><?=$b->passenger->first_name?> <?=$b->passenger->last_name?></div>
     <div style=position:absolute;top:70px;><?=$b->passenger->contact?></div>
     <div style=position:absolute;top:95px;left:<?=$left_x?>>Net Sales &nbsp;<?=$NS?></div>
     <div style=position:absolute;top:95px;left:<?=$left_x1?>>VAT (12%) &nbsp;<?=$VAT?></div>
     <div style=position:absolute;top:113px;left:<?=$left_x?>>Discount:0.00</div>
     <div style=position:absolute;top:133px;left:<?=$left_x?>><b><?=isset($amt) ? $amt : '0.00'?></b></div>
     <div style=position:absolute;top:153px;left:<?=$left_x?>><b><?=isset($b->seatingClass->name) ? $b->seatingClass->name : ''?></b></div>
     <div style=position:absolute;top:50px;left:115px><img src='<?=Yii::app()->createUrl('barcodeGenerator/generateBarcode',array('code'=>$b->ticket_no))?>'></div>
     <div style=position:absolute;top:128px;left:<?=$left_x1?>><b><?=$createdBy?></b></div>
   <div>

       </td>
     </tr>
   </table>
    <br><br><br>
  <?php endforeach; ?>
  </body>
