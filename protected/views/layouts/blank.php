<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html>
<head></head>
<body>
<?php
  $msgType='';
  if(Yii::app()->user->hasFlash("success"))
   $msgType='success';
  if(Yii::app()->user->hasFlash("error"))
   $msgType='error';
  if(Yii::app()->user->hasFlash("info"))
   $msgType='info';
  $this->widget('bootstrap.widgets.TbAlert', array(
    'block'=>true, // display a larger alert block?
    'fade'=>true, // use transitions?
    'closeText'=>'x', // close link text - if set to false, no close link is displayed
    'alerts'=>array( // configurations per alert type
	    $msgType=>array('block'=>true, 'fade'=>true, 'closeText'=>'x'), // success, info, warning, error or danger
    ),
  ));
?>
	<?php echo $content; ?>

</body>
</html>
