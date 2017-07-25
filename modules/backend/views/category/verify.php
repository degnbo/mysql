<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Category;

/* @var $this yii\web\View */
/* @var $model app\modules\backend\models\CategorySearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="category-search">

    <?php $form = ActiveForm::begin([
        //'action' => ['news/index'],
        'action' => ['mydata'],
        'method' => 'post',
        'options'=>['enctype' => 'multipart/form-data']
    ]); ?>

    <?= $form->field($model, 'id')->textInput() ?>
    <!--
    表单传值的解决案例
    -->
    <?php echo $form->field($model,'verifyCode',[ 'template'  =>
        '<div  class="row cl"><div class="formControls col-8 col-offset-3">{input}'.\yii\captcha\Captcha::widget([
            'model' =>$model,
            'attribute' =>'verifyCode',//模型中也要申明
            'captchaAction' =>'default/captcha',//指定操作
            'template'  =>'{image}',//image代表此处生成验证码图片
            'imageOptions'   =>[
                //以下atrribute属性，可自己扩展
                'title'  =>'点击刷新',
                'onclick'  =>'this.src=this.src+'."'?'".'+Math.random()',//js点击刷新
                'style' =>'margin-left:20px;'
            ],
        ]).'{error}</div></div>'])->textInput(['class'  =>'input-text size-L','placeholder'    =>'验证码','style'    =>'width:150px'])
        ->label(false);
    ?>
    <div class="form-group">
        <?= Html::submitButton('添加', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('重置', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
