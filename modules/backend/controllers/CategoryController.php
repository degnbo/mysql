<?php

namespace app\modules\backend\controllers;
//ison库用于处理json数据的
use yii\helpers\Json;

use app\models\Content;
use Yii;
use app\models\Category;
use app\modules\backend\models\CategorySearch;
use app\modules\backend\components\BackendController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * CategoryController implements the CRUD actions for Category model.
 */
class CategoryController extends BackendController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        header("Content-type:text/html;charset=utf-8");
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Category models.
     * @param int $type
     * @return mixed
     */
    public function actionIndex($type)
    {

        //render():渲染布局
        //renderPartial():渲染一个 视图名 并且不使用布局。
        //Yii::$app->request->isGet;
        //Yii::$app->request->isPost;
        //Yii::$app->request->isAjax 是否是ajax请求
        //Yii::$app->request->queryParams：得到的是数组，
        //与Yii::$app->request->get()相等
        //Yii::$app->request->bodyParams：得到的是数组，
        //与Yii::$app->request->post()相等
        //echo 1;die;
        //echo Yii::$app->request->get('type','34');die;//第二个参数表示默认值
        $searchModel = new CategorySearch();

        //$result=$searchModel->find()->indexBy('name')->asArray()->all();
        //var_dump($result);die;


        $params = Yii::$app->request->queryParams;//get请求
        //var_dump(Yii::$app->request);die;
        //echo $searchModel->formName();
        //

        $params[$searchModel->formName()]['type'] = $type;
        //print_r($params);die;


        $dataProvider = $searchModel->search($params);
        //print_r($dataProvider);die;
        //var_dump($searchModel);die;
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'type'=>$type,
        ]);
    }

    /**
     * Displays a single Category model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Category model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @param int $type
     * @return mixed
     */
    public function actionCreate($type)
    {
        $model = new Category();
        $model->type = $type;
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->showFlash('添加分类成功','success');
        } else {
            return $this->render('create', [
                'model' => $model,
                'type'=>$type,
            ]);
        }
    }

    /**
     * Updates an existing Category model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->showFlash('修改分类成功','success');
        } else {
            return $this->render('update', [
                'model' => $model,
                'type'=>$model->type,
            ]); 
        }
    }

    /**
     * Deletes an existing Category model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        Content::$currentType =null;
        $content = Content::find()->where(['category_id'=>$id])->limit(1)->one();
        if($content){
            return $this->showFlash('此分类下有内容，不可删除', Yii::$app->getUser()->getReturnUrl());
        }
        if($model->delete()){
            return $this->showFlash('删除成功','success', Yii::$app->getUser()->getReturnUrl());
        }
        return $this->showFlash('删除失败','danger', Yii::$app->getUser()->getReturnUrl());
    }

    /**
     * Finds the Category model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Category the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Category::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    //yii2表单提交
    public function actionMyform(){
        $searchModel = new CategorySearch();
        //$this->renderPartial()不使用模板布局
        //$this->render()使用模板布局
        //$list=Category::find()->one();
        //$list=Category::find()->all();
        //$list=Category::find()->select(['name','id'])->indexBy('id')->column();
        //$list=Category::find()->indexBy('id')->column();
        //var_dump($list);die;
        //echo Yii::$app->db->createCommand()->getRawSql();die;
        $list=CategorySearch::findOne(5);

        //echo Category::find()->createCommand()->getRawSql();die;
        //echo Json::encode($list);
        //var_dump($list);die;
        $list=CategorySearch::findOne(5);

        //Category::findOne(5);
        //var_dump($searchModel);die;
        return $this->render('myform',[
            'model'=>$list,
            //'list'=>$list
        ]);
    }


    public function actionMydata(){
        $model=new CategorySearch();
        var_dump(Yii::$app->request->post());die;
        if(Yii::$app->request->isPost) {
            //var_dump($_FILES['Category']);

            //单个图片上传
            /*$model->image=UploadedFile::getInstance($model,'image');
            $ext = $model->image->extension;
            //echo $ext;die;
            $basedir = "uploads/photo/".date("Y-m-d").'/';
            if(!file_exists($basedir)){
                mkdir($basedir,0777,true);
            }
            $imageName = uniqid().rand(1000,9999).'.'.$ext;
            $model->image->saveAs($basedir.$imageName);//设置图片的存储位置*/
            //yii2文件上传多文件上传
            $model->image=UploadedFile::getInstances($model,'image');//比单文件多一个s
            //echo $dir;die;
            if ($model->image && $model->validate()) {
                foreach ($model->image as $file) {
                    //var_dump($file->className());die;
                    $ext = $file->extension;//
                    //$basename=$file->baseName;文件的基本名字
                    //echo $ext;die;
                    $basedir = "uploads/photo/".date("Y-m-d").'/';
                    if(!file_exists($basedir)){
                        mkdir($basedir,0777,true);
                    }
                    $imageName = uniqid().rand(1000,9999).'.'.$ext;
                    $file->saveAs($basedir.$imageName);//设置图片的存储位置
                }
            }
            //var_dump($model->image);
        }
        //var_dump(Yii::$app->request->post());die;
    }
    public function actionUpload(){
        $model=new CategorySearch();

    }
    public function actions() {
        //echo 1;die;
        return [
            'captcha' =>  [
                'class' => 'yii\captcha\CaptchaAction',
                'height' => 50,
                'width' => 80,
                'minLength' => 4,
                'maxLength' => 4
            ],
        ];
    }
    public function actionYzm(){
        $model=new CategorySearch();
        return $this->render('verify',[
            'model'=>$model,
        ]);
        /*return [
            'captcha' =>  [
                'class' => 'yii\captcha\CaptchaAction',
                'height' => 50,
                'width' => 80,
                'minLength' => 4,
                'maxLength' => 4
            ],
        ];*/
    }
}
