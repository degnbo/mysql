<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\BeidouType */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Beidou Type',
]) . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Beidou Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="beidou-type-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
