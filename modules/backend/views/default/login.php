<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 2016/12/7
 * Time: 15:25
 * Email:liyongsheng@meicai.cn
 */

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\modules\backend\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = Yii::$app->name;
$fieldOptions1 = [
    'options' => ['class' => 'form-group has-feedback'],
    'inputTemplate' => "{input}<span class='glyphicon glyphicon-envelope form-control-feedback'></span>"
];

$fieldOptions2 = [
    'options' => ['class' => 'form-group has-feedback'],
    'inputTemplate' => "{input}<span class='glyphicon glyphicon-lock form-control-feedback'></span>"
];
?>
<div class="site-login login-box">
    <div class="login-logo">
        <a href="#"><b><?= Html::encode($this->title) ?></b></a>
    </div>
    <div class="login-box-body">

        <?php $form = ActiveForm::begin([
            'id' => 'login-form',
            //'action'=>['index'],
            'enableClientValidation' => false,
        ]); ?>

        <?= $form->field($model, 'username', $fieldOptions1)->label(false)->textInput(['autofocus' => true]) ?>
        <?/*= $form->field($model, 'name', $fieldOptions1)->label(false)->textInput() */?>
        <?= $form->field($model, 'password', $fieldOptions2)->label(false)->passwordInput() ?>

        <?php /*echo $form->field($model,'verifyCode',[ 'template'  =>
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
        */?>
        <div class="row">
            <div class="col-xs-8">
                <?= $form->field($model, 'rememberMe')->checkbox() ?>
            </div>
            <!-- /.col -->
            <div class="col-xs-4">
                <?= Html::submitButton('登录', ['class' => 'btn btn-primary btn-block btn-flat', 'name' => 'login-button']) ?>
            </div>
            <!-- /.col -->
        </div>
        <?php ActiveForm::end(); ?>

        <div class="social-auth-links">
            You may login with <strong>admin/admin123</strong>.<br>
        </div>
    </div>
</div>
