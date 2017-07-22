<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 2016/12/24
 * Time: 13:41
 * Email:liyongsheng@meicai.cn
 */

namespace app\modules\backend\controllers;

use app\modules\backend\actions\ContentDeleteAllAction;
use app\modules\backend\actions\ContentCheckAction;
use app\models\PhotosDetail;
use app\modules\backend\components\BackendController;
use app\models\Photos;
use app\modules\backend\models\PhotosSearch;
use Faker\Provider\he_IL\PhoneNumber;
use yii\data\Pagination;
use yii\filters\VerbFilter;
use Yii;
use yii\web\NotFoundHttpException;
use yii\web\Response;
//详情的模型
use yii\widgets\DetailView;
//
use yii\widgets\ListView;
use yii\data\ActiveDataProvider;

//
use app\modules\backend\models\NewsSearch;



class PhotosController extends BackendController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                    'delete-detail' => ['POST'],
                    'edit-detail' => ['POST'],
                ],
            ],
        ];
    }
    public function actions()
    {
        header("Content-type:text/html;charset=utf-8");
        return array_merge(parent::actions(), [
            'check'=>[
                'class'=>ContentCheckAction::className(),
                'type'=>Photos::$currentType,
                'status'=>Photos::STATUS_ENABLE
            ],
            'un-check'=>[
                'class'=>ContentCheckAction::className(),
                'type'=>Photos::$currentType,
                'status'=>Photos::STATUS_DISABLE
            ],
            'delete-all'=>[
                'class'=>ContentDeleteAllAction::className(),
                'type'=>Photos::$currentType,
            ]
        ]);
    }
    /*
     * DetailView的使用
     * */
    public function actionCeshi(){
        header("Content-type:text/html;charset=utf-8");
        $searchModel = new PhotosSearch();
        echo DetailView::widget([
            'model' => PhotosSearch::findOne([31]),
            'attributes' => [
                'title',               // title attribute (in plain text)
                'description:html',    // description attribute formatted as HTML
                [                      // the owner name of the model
                    'label' => 'Owner',
                    'value' => 'fsf',
                ],
                'created_at:datetime', // creation date formatted as datetime
            ],
        ]);
        die;
    }
    /*
     *
     * */
    public function actionCeshi1(){
        //分页类的使用
        header("Content-type:text/html;charset=utf-8");
        $query=PhotosSearch::find();
        $countquery=clone $query;
        $count=$countquery->count();
        //echo $count;die;

        /*$sort = new Sort([
            'attributes' => [
                'age',
                'name' => [
                    'asc' => ['first_name' => SORT_ASC, 'last_name' => SORT_ASC],
                    'desc' => ['first_name' => SORT_DESC, 'last_name' => SORT_DESC],
                    'default' => SORT_DESC,
                    'label' => 'Name',
                ],
            ],
        ]);*/

        $page=new Pagination(['totalCount'=>$count,'pageSize'=>'1']);
        //$page->offset
        //var_dump($page->offset);
        $models=$query->offset($page->offset)->limit($page->limit)->all();
        //var_dump($list);die;
        return $this->render('_ceshi1',[
            'pages'=>$page,
            'models'=>$models
        ]);

        /*$dataProvider = new ActiveDataProvider([
            'query' => PhotosSearch::find()->where(''),
            'pagination' => [
                'pageSize' => 20,
            ],
        ]);*/

    }

    /**
     * Lists all Content models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PhotosSearch();
        //Yii::$app->request->queryParams相当于通过get获取
        //var_dump(Yii::$app->request->queryParams);die;
        //$this->module->params['pageSize']
        $pagesize=1;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $pagesize);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    /**
     * Displays a single Content model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $detailModelList = PhotosDetail::find()->where(['content_id'=>$model->id])->all();
//        print_r($detailModelList);
        $newPhotoDetail = new PhotosDetail();
        $newPhotoDetail->content_id = $model->id;
        return $this->render('view', [
            'model' => $model,
            'detailModelList' =>$detailModelList,
            'newPhotoDetail' =>$newPhotoDetail,
        ]);
    }

    /**
     * 上传图片
     * @return array
     */
    public function actionUploadPhoto()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = new PhotosDetail();
        if($model->load(Yii::$app->request->post()) && $model->uploadPhoto()){
            return [
                'code'=>0,
                'data'=>$this->renderPartial('_detail_item',['model'=>$model]),
            ];
        }
        return [
            'code'=>1,
            'data'=>empty($model->firstErrors)?'上传失败':$model->firstErrors,
        ];
    }

    /**
     * 设置相册封面
     * @param int $id
     * @return array
     */
    public function actionSetCover($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $detailModel = PhotosDetail::findOne($id);
        if(empty($detailModel)){
            return [
                'code'=>1,
                'data'=>'照片不存在'
            ];
        }
        $model = $detailModel->content;
        if(empty($model)){
            return [
                'code'=>1,
                'data'=>'相册不存在'
            ];
        }
        if($detailModel->setCover()){
            return [
                'code'=>0,
                'data'=>'操作成功'
            ];
        }
        return [
            'code'=>1,
            'data'=>empty($model->firstErrors)?'操作失败':$model->firstErrors,
        ];
    }

    /**
     * 修改照片详情
     * @param int $id
     * @return array
     */
    public function actionEditDetail($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = PhotosDetail::findOne($id);
        if($model->load(Yii::$app->request->post()) && $model->save()){
            return [
                'code'=>0,
                'data'=>'ok',
            ];
        }
        return [
            'code'=>1,
            'data'=>empty($model->firstErrors)?'修改失败':$model->firstErrors,
        ];
    }

    /**
     * @param $id
     * @return array
     */
    public function actionDeleteDetail($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = PhotosDetail::findOne($id);
        if(empty($model)){
            return [
                'code'=>1,
                'data'=>'图片不存在或者已删除',
            ];
        }
        try {
            $model->delete();
            return [
                'code' => 0,
                'data' => '删除成功',
            ];
        }catch(\Exception $e){
            return [
                'code' => 1,
                'data' => $e->getMessage(),
            ];
        }
    }
    /**
     * Creates a new Content model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Photos();
        $post = Yii::$app->request->post();
        if ($post) {
            if ($model->load($post) && $model->save()) {
                return $this->showFlash('添加成功','success');
            }
        }
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Content model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->showFlash('修改新闻成功','success');
        }
        return $this->render('update', [
            'model' => $model,
        ]);

    }

    /**
     * Deletes an existing Content model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if($this->findModel($id)->delete()){
            return $this->showFlash('删除成功','success',['index']);
        }
        return $this->showFlash('删除失败', 'danger',Yii::$app->getUser()->getReturnUrl());
    }

    /**
     * Finds the Content model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Photos the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Photos::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}