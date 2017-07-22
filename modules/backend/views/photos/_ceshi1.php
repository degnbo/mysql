<?php
use yii\helpers\Html;
use yii\helpers\HtmlPurifier;
use yii\widgets\LinkPager;
?>
<div class="ceshi1">
    <!--<h2><?/*= Html::encode($model->title) */?></h2>

    --><?/*= HtmlPurifier::process($model->description) */?>
</div>
<div>
    <?php foreach($models as $k=>$model): ?>
    <tr>
        <td><?=$model->title?></td>
        <td><?=$model->description?></td>
    </tr>
   <?php endforeach;?>
</div>
<div>
<?php echo LinkPager::widget([
    'pagination' => $pages,
    ]);
?>
