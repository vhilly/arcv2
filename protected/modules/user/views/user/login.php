    <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id'=>'verticalForm',
    'htmlOptions'=>array('class'=>'well'),
    )); ?>
     
    <?php echo $form->textFieldRow($model, 'username', array('class'=>'span3')); ?>
    <?php echo $form->passwordFieldRow($model, 'password', array('class'=>'span3')); ?>
    <?php echo $form->checkboxRow($model, 'rememberMe'); ?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit','type'=>'primary', 'label'=>'Login')); ?>
     
    <?php $this->endWidget(); ?>


<?php
$form = new CForm(array(
    'elements'=>array(
        'username'=>array(
            'type'=>'text',
            'maxlength'=>32,
        ),
        'password'=>array(
            'type'=>'password',
            'maxlength'=>32,
        ),
        'rememberMe'=>array(
            'type'=>'checkbox',
        )
    ),

    'buttons'=>array(
        'login'=>array(
            'type'=>'submit',
            'label'=>'Login',
        ),
    ),
), $model);
?>
