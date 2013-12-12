<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
<div class="row">
    <div class="span9">
        <div id="content">
			<?php echo $content; ?>
        </div><!-- content -->
    </div>
    <div class="span3">
        <div id="sidebar" class="booth-sidebar">
         <iframe id=stats src=<?=Yii::app()->createUrl('app/ticketStats')?> frameborder=0 ></iframe>
        </div><!-- sidebar -->
    </div>
</div>
<?php $this->endContent(); ?>
<script type="text/javascript">
    setInterval(refreshIframe, 3000);
    function refreshIframe() {
        $("#stats")[0].src = $("#stats")[0].src;
    }
</script>

