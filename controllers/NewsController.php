<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 2016/12/10
 * Time: 13:31
 * Email:liyongsheng@meicai.cn
 */

namespace app\controllers;


use yii\db\Query;
//这个类主要是用来调用数据库模型的主要用于这个类from，select等等
use app\models\Category;
use app\models\Content;
use app\models\News;
use yii\data\ActiveDataProvider;
use Yii;
use yii\web\NotFoundHttpException;
use app\components\AppController as Controller;

class NewsController extends Controller
{

    public function actionFormate(){
        header('Content-type:text/html;charset=utf-8');
        //数据个提示话
        $formatter = Yii::$app->formatter;
        //echo $formatter->asDate('2017-3-6');
        //echo $formatter->asDatetime('2017-3-6','date');
        //echo $formatter->asEmail('cebe@example.com');
        //echo $formatter->asPercent(10.125, 4);//格式化，小数变成百分数
        //Yii::$app->formatter->locale = 'en-US';
        echo Yii::$app->formatter->asDate('2014-01-01');
        echo Yii::$app->formatter->asTimestamp('2014-01-01');
        //echo Yii::$app->formatter->asDatetime(1412599260);
        //echo Yii::$app->formatter->asDate('now', 'YYYY-MM-dd');
    }
    /**
     * 相册详情
     * @return string
     * @throws NotFoundHttpException
     */
    public function actionIndex()
    {
        header('Content-type:text/html;charset=utf-8');
        //$products = Products::find()->orderBy('id desc')->limit(12)->asarray()->all();
        $list1=Category::findOne(1);
        $db=Yii::$app->db;
        $query=new Query();
        $list=$db->createCommand('select * from content')->queryAll();
        //$list1=(new Query())->from('content')->all();
        //$list1=$query->select(['title'])->from('content')->one();
        //$list1=$query->select('*')->from('content')->limit(1)->all();
        var_dump($list1);die;

        //echo 1;die;
        die;
        $id = Yii::$app->request->get('id');
        if(empty($id)){
            return $this->redirect(['list']);
        }
        return $this->actionItem($id);
    }
    /**
     * 新闻详情页
     * @param $id
     * @return string
     * @throws NotFoundHttpException
     */
    public function actionItem($id)
    {
        if(empty($id)){
            $this->redirect(['list']);
        }
        //$this->createCommand($db)->queryOne();
        $model = News::find()->where(['status'=>News::STATUS_ENABLE, 'id'=>$id])->one();
        if(empty($model)){
            throw new NotFoundHttpException('你查看的页面不存在或者已删除');
        }
        if(!empty($model->keywords)){
            $this->view->registerMetaTag(['name'=>'keywords', 'content'=>$model->keywords],'keywords');
        }
        if(!empty($model->description)){
            $this->view->registerMetaTag(['name'=>'description', 'content'=>$model->description], 'description');
        }
        //return $this->render('index',['model'=>$model]);
        $this->renderPartial('index');

    }

    /**
     * Displays news page
     *
     * @return string
     */
    public function actionList()
    {
        $categoryId = Yii::$app->request->get('category-id');
        //echo $categoryId;die;
        $query = News::find()->where(['status'=>News::STATUS_ENABLE]);
        print_r($query);
        if($categoryId){
            $query->andWhere(['category_id'=>$categoryId]);
            $category = Category::findOne($categoryId);
        }else{
            $category = new Category();
            $category->type = News::$currentType;
        }
        // add conditions that should always apply here
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=>['defaultOrder'=>['id'=>SORT_DESC]],
            'pagination' => ['pageSize'=>Yii::$app->params['pageSize']]
        ]);

        return $this->render('list', [
            'category'=>$category,
            'searchModel' => new News(),
            'dataProvider' => $dataProvider
        ]);
    }
}