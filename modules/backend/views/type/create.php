<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\BeidouType */

$this->title = Yii::t('app', 'Create Beidou Type');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Beidou Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="beidou-type-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
