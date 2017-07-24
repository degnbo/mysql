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

    <div class="form-group">
        <?= Html::submitButton('添加', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('重置', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
