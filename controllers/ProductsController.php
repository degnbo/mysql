<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 2016/12/11
 * Time: 21:42
 * Email:liyongsheng@meicai.cn
 */

namespace app\controllers;

use yii\db\Query;
//小部件
use yii\widgets\ListView;
use yii\grid\GridView;
//分页类
use yii\data\Pagination;

use yii\web\NotFoundHttpException;
use app\models\Products;
use app\components\AppController as Controller;
//活动数据提供者
use yii\data\ActiveDataProvider;
//数组提供者
use yii\data\ArrayDataProvider;
use Yii;
use app\models\Category;

class ProductsController extends Controller
{
    /**
     * 产品首页
     * @return string
     * @throws NotFoundHttpException
     */
    public function actionIndex()
    {
        $id = Yii::$app->request->get('id');
        if(empty($id)){
            return $this->redirect(['list']);
        }
        return $this->actionItem($id);
    }

    /**
     * @param int $id
     * @return string
     * @throws NotFoundHttpException
     */
    public function actionItem($id)
    {

        $model = Products::find()->where(['status'=>Products::STATUS_ENABLE, 'id'=>$id])->one();

        if(empty($model)){
            throw new NotFoundHttpException('你查看的页面不存在或者已删除');
        }
        if(!empty($model->keywords)){
            $this->view->registerMetaTag(['name'=>'keywords', 'content'=>$model->keywords],'keywords');
        }
        if(!empty($model->description)){
            $this->view->registerMetaTag(['name'=>'description', 'content'=>$model->description], 'description');
        }

        return $this->render('index',['model'=>$model]);
    }
    /**
     * Displays news page
     *
     * @return string
     */
    public function actionList()
    {
        header("Content-type:text/html;charset=utf-8");
        //array数组provider
        //1.ArrayDataProvider
        /*$data = [
            ['id' => 1, 'name' => 'name 1'],
            ['id' => 2, 'name' => 'name 2'],
            ['id' => 100, 'name' => 'name 100']
        ];
        $provider = new ArrayDataProvider([
            'allModels' => $data,
            'pagination' => [
                'pageSize' => 2,
            ],
            'sort' => [
                'attributes' => ['id', 'name'],
            ],
        ]);
        echo ListView::widget([
            'dataProvider' => $provider,
            //'itemView' => 'list',
        ]);die;*/
        //2.ActiveDataProvider
        $query = Products::find()->where(['status'=>Products::STATUS_ENABLE]);
        //$query=$query=new Query();
        //$query=$query->from('admin_menu');
        $provider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 2,
            ],
            'sort' => [
                'attributes' => ['id', 'description'],
            ],
        ]);
        echo GridView::widget([
            'dataProvider' =>  $provider,
        ]);die;
        /*echo ListView::widget([
            'dataProvider' => $provider,
            //'itemView' => 'list',
        ]);die;*/
        //var_dump($models = $provider->getModels());
        //echo $count = $provider->getCount();
        //var_dump(json_decode(json_encode($provider),TRUE));die;
        $categoryId = Yii::$app->request->get('category-id');
        //var_dump($categoryId);
        $query = Products::find()->where(['status'=>Products::STATUS_ENABLE]);
        //var_dump($query);die;
        //$count = $query->count();
        //echo $count;die;
        if($categoryId){
            $query->andWhere(['category_id'=>$categoryId]);
            $category = Category::findOne($categoryId);
        }else{
            $category = new Category();
            $category->type = Products::$currentType;
        }
        //echo Yii::$app->params['cacheDuration'];
        //var_dump(Yii::$app->test);die;
        //var_dump(Yii::$app->params);
        // add conditions that should always apply here
        //$pagesize=Yii::$app->params['pageSize'];
        $pagesize=3;
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=>['defaultOrder'=>['id'=>SORT_DESC]],
            'pagination' => ['pageSize'=>3]
        ]);

        return $this->render('list', [
            'category'=>$category,
            'searchModel' => new Products(),
            'dataProvider' => $dataProvider
        ]);
    }
}