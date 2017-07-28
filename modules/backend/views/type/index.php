<?php

use yii\helpers\Html;
use app\modules\backend\widgets\GridView;
use app\models\Category;
/* @var $this yii\web\View */
/* @var $searchModel app\modules\backend\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/** @var int $type */

$this->title = '分类管理';
$this->params['breadcrumbs'][] = '分类列表';
?>
<div class="category-index">
    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><?= Html::a('分类列表', ['index']) ?></li>
            <li role="presentation"><?= Html::a('添加分类', ['create']) ?></li>
        </ul>
        <div class="tab-content">
            <?php ///echo $this->render('_search', ['model' => $searchModel]); ?>

            <?= GridView::widget([
                'layout'=>"{summary}\n{items}\n{pager}",
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
                    [
                        'attribute' => 'id',
                        'options' => ['style' => 'width:50px']
                    ],
                    'tname',
                    'cate_id',
                    /*[
                        'filterType'=>'date',
                        'attribute' => 'created_at',
                        'format' => 'datetime',
                        'options' => ['style' => 'width:150px']
                    ],*/
                    //'updated_at',
                    [
                        'class' => 'yii\grid\ActionColumn',
                        'options' => ['style' => 'width:120px'],
                        'template' => '{view} {update} {delete}'
                    ],
                ],
            ]); ?>
        </div>
    </div>
</div>
