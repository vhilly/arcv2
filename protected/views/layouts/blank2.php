<?php /* @var $this Controller */ ?>
<!DOCTYPE html>

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
	
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/styles.css" />
	<style>
		* {
			font-size:12px;
		}
		body {
			margin: 0;
			font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
			font-size: 12px;
			line-height: 18px;
			font-weight: normal;
			color: #4d4d4d;
		}
		.container-fluid {
			padding-right: 10px;
			padding-left: 10px;
		}
		div {
			display: block;
		}
	</style>
	<?php echo $content; ?>
