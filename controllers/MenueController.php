<?php

namespace app\controllers;

use app\models\BeidouArticle;

class MenueController extends \yii\web\Controller
{
    public function actionIndex()
    {
        header("Content-type:text/html;charset=utf-8");
        //indexBy(function ($row) {return $row['id'];})->
        //$list=BeidouArticle::find()->asArray()->joinWith('record')->all();
        //联合查询
        $list=BeidouArticle::find()->select('b.*,a.tname')->
        leftJoin(['a'=>'beidou_type'],'b.type_id=a.id')->
        from('beidou_article b');
        //each 的使用可以降低内存的消耗建议对处理大数据的时候使用
        //batch()在处理大数据的时候使用，如果用全部查询到内存中对内存的消耗特别的大，
        foreach($list->each(2) as $k=>$model){
            var_dump($model['id']);
        }
        //$list=$model->record;
        //echo $list->getRawSql();
        //var_dump($list);
        //echo  1;die;

        //return $this->render('index');
    }

}
