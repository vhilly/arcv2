<style>
table {
  font-family:courier;
}
table {
  border-collapse:collapse;
}
tr.border td, tr.border th {
  border:1px solid black;
  padding:0 3px;
}
</style>
  <?php $counter=1;?>
  <table class='' style="font-size:12px;width:750px">
  <?php foreach($mnfst as $key=>$b): ?>
  <?php 
    if(!$key){
      $vessel = isset($b->voyage0->vessel0->name) ? $b->voyage0->vessel0->name : '________';
      $from = isset($b->voyage0->route0->sourcePort->name) ? $b->voyage0->route0->sourcePort->name : '________';
      $dept_date = isset($b->voyage0->departure_date) ? $b->voyage0->departure_date : '';
      $day = date("jS",strtotime($dept_date));
      $month = date("F",strtotime($dept_date));
      $year = date("Y",strtotime($dept_date));
      $date = date("Y/m/d");
      $today = date("jS",strtotime($date));
      $tomonth = date("F",strtotime($date));
      $toyear = date("Y",strtotime($date));
      $to = isset($b->voyage0->route0->destPort->name) ? $b->voyage0->route0->destPort->name : '________';
    }
  ?>

  <?php if($counter==1):?>
    <tr>
       <td colspan=8>
    <center style="font-size:12px;text-align:center ">Republic of the Philippines<br>
      <b style="font-size:12px">Department of Finance<br>BUREAU OF CUSTOMS<b><br><br>
      <b><span style="border-bottom:1px solid; font-size:14px;">PASSENGERS COASTING MANIFEST</span></b>
    </center><br>
    <div style="text-indent:30px;font-size:12px">
      Complete list of all passengers taken on board the <u><?=$vessel?></u> sailing from the port of <u><?=$from?></u> on the <u><?=$day?></u> day of <u><?=$month?></u>, 
      <u><?=$year?></u> for the port of <u><?=$to?></u><br><br>
    </div>
        </td>
      <tr>
      <tr class="border">
        <th></th>
        <th width="200px">NAME OF PASSENGERS</th>
        <th>SEX</th>
        <th>AGE</th>
        <th>CIVIL STATUS</th>
        <th>NATIONALITY</th>
        <th width="300px">HOME ADDRESS</th>
        <th>DESTINATION</th>
      </tr>

  <?php endif;?>

       <?php //$birthDate = explode("-", $b->passenger->birth_date); $age = (date("md", date("U", mktime(0, 0, 0, $birthDate[1], $birthDate[2], $birthDate[0]))) > date("md") ? 
        // ((date("Y")-$birthDate[0])-1):(date("Y")-$birthDate[0]));
       ?>
      <tr class="border">
        <td><?=$key+1?>.
         </td>
        <td> <?=ucwords($b->passenger0->first_name)?> <?=ucwords($b->passenger0->last_name)?> </td>
        <td style="text-align:center"> <?=$b->passenger0->gender?></td>
        <td style="text-align:center"> <?=$b->passenger0->age?></td>
        <td style="text-align:center"> <?=$b->passenger0->civil_status ?$cs[$b->passenger0->civil_status] : ''?> </td>
        <td style="text-align:center"> <?=$b->passenger0->nationality?></td>
        <td> <?=$b->passenger0->address?> </td>
        <td style="text-align:center"> <?=$b->voyage0->route0->destPort->name?> </td>
      </tr>
  <?php if($counter==40 || (count($mnfst) == $key+1)):?>

      <tr>
        <td colspan='8' style="border:1px solid white;border-top:1px"><br>
	  District of <u><?=$from?></u>, Port of <u><?=$from?></u> to <u><?=$to?></u> Master/Patron of <span style="border-bottom:1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><!--________________________________ -->
	  Hereby solemnly swear (or affirm) that the foregoing is a full and complete manifest of all passengers on board the said vessel and
	  that all statement contained herein is true to be the best of my knowledge and belief.<br><br>
	  <table style="">
            <tr>
              <td width=75% style='border-top:1px solid white'>&nbsp;</td>
	      <td width=200px style='border-top:1px solid black;text-align:center;padding:1px'><span style="font-size:12px;">MASTER  PATRON</span></td>
            </tr>
	  </table>
	  <table>
	    <tr>
	      <td  style='border-top:1px solid white;font-size:12px'>
                SUBSCRIBED AND SWORN TO before me this <u><?=$today?></u> day of <u><?=$tomonth?></u>, 
                <u><?=$toyear?></u> in the city of <u><?=$from?></u>, Philippines.
              </td>
	    </tr>
          </table>
          <br>
          <br>
	  <table style="">
            <tr>
              <td width=75% style='border-top:1px solid white'>&nbsp;</td>
              <td width=200px style='border-top:1px solid black;text-align:center;padding:1px'><span style="font-size:12px;">ADMINISTERING OFFICER</span></td>
            </tr>
          </table>
	</td>
      </tr>
     <?php $counter=0;?>
  <?php endif;?>
    

   <?php $counter++;?>
  <?php endforeach; ?>
   </table>
