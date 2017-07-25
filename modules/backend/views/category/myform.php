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
        //'enableClientValidation' => true, //开启客户端验证，生成js
        'options'=>['enctype' => 'multipart/form-data']
    ]); ?>

    <?= $form->field($model, 'id') ?>
    <!--
    表单传值的解决案例
    -->

    <? echo $form->field($model, 'pid')->passwordInput() ?>
    <?=$model->pid=2?>
    <?= $form->field($model, 'pid')->textInput()->hint('Please enter your name')->label('parentId') ?>
    <? $model->name=['a','b','c'];?>

    <?= $form->field($model, 'name')->checkboxList(['a' => 'Item A', 'b' => 'Item B', 'c' => 'Item C']);?>
    <?//$model->type = $list->type; ?>
    <?= $form->field($model, 'type')->radioList(['1'=>'a','2'=>'b','3'=>'c','4'=>'d']) ?>

    <? //$model->created_at='2' ;?>
    <?= $form->field($model, 'created_at')->dropDownList(Category::find()->select('name,id')->indexBy('id')->column(),['prompt'=>'请选择']) ?>

    <?php // echo $form->field($model, 'updated_at') ?>
    <?= $form->field($model, 'image[]')->fileInput(['multiple' => true, 'accept' => 'image/jpg,image/gif,image/png']) ?>
    <?/*= $form->field($model,'verifyCode')->widget(
        yii\captcha\Captcha::className(),
        ['captchaAction'=>'category/captcha',
            'imageOptions'=>['alt'=>'点击换图','title'=>'点击换图', 'style'=>'cursor:pointer']
        ]
    );*/?>
    <?php echo $form->field($model,'verifyCode',[ 'template'  =>
        '<div  class="row cl"><div class="formControls col-8 col-offset-3">{input}'.\yii\captcha\Captcha::widget([
            'model' =>$model,
            'attribute' =>'verifyCode',//模型中也要申明
            'captchaAction' =>'category/captcha',//指定操作
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
