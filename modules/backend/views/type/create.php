<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\BeidouType */

$this->title = Yii::t('app', '添加分类');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', '分类列表'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="beidou-type-create">
    <h1><?= Html::encode($this->title) ?></h1>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
