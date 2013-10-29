<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
	
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/styles.css" />
	<style>
		* {
			font-size:12px;
		}
	</style>
</head>

<body>
<?php
   $apps = "
      <ul class='gb_q gb_t'>
        <li class='gb_i'>
          <a  class='gb_a' href=".Yii::app()->createUrl('app/ticketingBooth').">
            <span class='gb_c icon-ticket icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.ticket.booth')."</span>
          </a>
        </li>
        <li class='gb_i'>
          <a class='gb_a' href=".Yii::app()->createUrl('app/checkin').">
            <span class='gb_c icon-check icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.checkin')."</span>
          </a>
        </li>
        <li class='gb_i'>
          <a class='gb_a' href=".Yii::app()->createUrl('app/tickets').">
            <span class='gb_c icon-barcode icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.tickets')."</span>
          </a>
        </li>
      </ul>
   ";
   $settings = "
      <ul class='gb_q gb_t'>
        <li class='gb_i'>
          <a  class='gb_a' href=".Yii::app()->createUrl('admin/vessel').">
            <span class='gb_c icon-anchor icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.vessel')."</span>
          </a>
        </li>
        <li class='gb_i'>
          <a class='gb_a' href=".Yii::app()->createUrl('admin/port').">
            <span class='gb_c icon-map-marker icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.port')."</span>
          </a>
        </li>
        <li class='gb_i'>
          <a class='gb_a' href=".Yii::app()->createUrl('admin/route').">
            <span class='gb_c icon-compass icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.route')."</span>
          </a>
        </li>
        <li class='gb_i'>
          <a class='gb_a' href=".Yii::app()->createUrl('admin/voyage').">
            <span class='gb_c icon-calendar icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.voyage')."</span>
          </a>
        </li>
        <li class='gb_i'>
          <a class='gb_a' href=".Yii::app()->createUrl('admin/seatingclass').">
            <span class='gb_c icon-linux icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.seatingclass')."</span>
          </a>
        </li>
        <li class='gb_i'>
          <a class='gb_a' href=".Yii::app()->createUrl('admin/passengertype').">
            <span class='gb_c icon-group icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.passengertype')."</span>
          </a>
        </li>
        <li class='gb_i'>
          <a class='gb_a' href=".Yii::app()->createUrl('admin/passengerFare').">
            <span class='gb_c icon-tag icon-3x'></span>
            <span class='gb_d'>".Yii::t('app','label.passengertype')."</span>
          </a>
        </li>
      </ul>
   ";
   $this->widget('bootstrap.widgets.TbNavbar', array(
    'type'=>'inverse', // null or 'inverse'
    'brand'=>'',
    'brandUrl'=>'#',
    'collapse'=>false, // requires bootstrap-responsive.css
    'fluid'=>true,
    'items'=>array(
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'items'=>array(
		'...',
                array('icon'=>'icon-dashboard icon-2x','label'=>'', 'url'=>array('/site/index')),
		'...',
            ),
        ),
       // '<form class="navbar-search pull-left" action=""><input type="text" class="search-query span2" placeholder="Search"></form>',
						'<div class="pull-right sub-brand"></div>',
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'htmlOptions'=>array('class'=>'pull-right'),
            'items'=>array(
                
                array('icon'=>'icon-off icon-2x','label'=>'Login', 'url'=>array('/user/login'), 'visible'=>Yii::app()->user->isGuest),
                array('icon'=>'icon-user icon-2x','label'=>'('.Yii::app()->user->name.')', 'url'=>'#', 'items'=>array(
                    array('icon'=>'cog','label'=>'SETTINGS'),
                    '---',
                    array('','label'=>'Vessel', 'url'=>array('/admin/vessel')), 
                    array('icon'=>'off','label'=>'Logout', 'url'=>array('/site/logout')), 
                ),'visible'=>!Yii::app()->user->isGuest ),
            ),
        ),
      '<ul class="nav ">
        <li><a title="" data-original-title="" data-title="&nbsp;" data-placement="bottom" 
            data-content="'.$apps.'" data-toggle="popover" data-html=true id="yw2"><i class="icon-th icon-2x"> </i></a>
        </li>
       </ul>',
      '<ul class=\'nav pull-right\'>
        <li><a title="" data-original-title="" data-title="&nbsp;" data-placement="bottom" 
            data-content="'.$settings.'" data-toggle="popover" data-html=true id="yw2"><i class="icon-gears icon-2x"> </i></a>
        </li>
       </ul>',
    ),
)); ?>


<div class="fluid" id="page">
  <center>
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
  </center>
        <div class='container'>
	<?php echo $content; ?>
        </div>
	<div class="clear"></div>

	<div class="footer">
		<p>&copy; <?php echo date('Y'); ?> Archipelago | Philippine Ferries Corporation.<p/>
		<p>Designed by A-Team.<p/>
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
