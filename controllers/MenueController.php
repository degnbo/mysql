<?php

namespace app\controllers;

use app\models\BeidouArticle;

class MenueController extends \yii\web\Controller
{
    public function actionIndex()
    {
        $list=BeidouArticle::find()->all();
        //$list=$model->record;
        //var_dump($list);
        //echo  1;die;
        return $this->render('index');
    }

}
