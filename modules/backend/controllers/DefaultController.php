<?php

namespace app\modules\backend\controllers;
//路由
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use yii\helpers\url;
use yii\helpers\Json;
use app\modules\backend\components\BackendController;
use app\modules\backend\models\AdminUser;
use app\modules\backend\models\EditPasswordForm;
use Yii;
use app\modules\backend\models\LoginForm;
use yii\filters\VerbFilter;
use app\helpers\StringHelper;
/**
 * Default controller for the `backend` module
 */
class DefaultController extends BackendController
{

    public function actions()
    {
        header('Content-type:text/html;charset=utf-8');
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'ueditor' => $this->module->components['UEditorAction'],
            'captcha' =>  [
                'class' => 'yii\captcha\CaptchaAction',
                //'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
                'height' => 50,
                'width' => 80,
                'minLength' => 4,
                'maxLength' => 4
            ],
        ];
    }
    /**
     * 后台首页
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        //var_dump(Yii::$app->user);die;
        //echo 2;die;
        return $this->render('index');
    }

    /**
     * 登录页面
     * @return string
     */
    public function actionLogin()
    {
        /*class Foo {
            public $foobar = 'Foo';
            public function test() {
                echo $this->foobar . "\n";
            }
        }
        class Bar extends Foo {
            public $foobar = 'Bar';
        }
        $a = new Foo();
        $b = new Bar();
        echo "use of test() method\n";
        $a->test();
        $b->test();
        echo "instanceof Foo\n";
        var_dump($a instanceof Foo); // TRUE
        var_dump($b instanceof Foo); // TRUE
        echo "instanceof Bar\n";
        var_dump($a instanceof Bar); // FALSE
        var_dump($b instanceof Bar); // TRUE
        echo "subclass of Foo\n";
        var_dump(is_subclass_of($a, 'Foo')); // FALSE
        var_dump(is_subclass_of($b, 'Foo')); // TRUE
        echo "subclass of Bar\n";
        var_dump(is_subclass_of($a, 'Bar')); // FALSE
        var_dump(is_subclass_of($b, 'Bar')); // FALSE*/
        //$userHost = Yii::$app->request->headers;//这个是一个私有属性要用get调用
        //$userIP = Yii::$app->request->userIP;
        //var_dump($userHost);die;
        //var_dump(Json::decode(Json::encode($userHost),true));die;
        //路由use yii\helpers\url;
        //echo Url::to(['post/view', 'id' => 100,'name'=>'fsf','sex'=>'sfsf']);die;
        //echo 1;die;
        //$this->layout = 'main-login.php';
        //$session = Yii::$app->session;
        //$cookies = Yii::$app->request->cookies;获取cookie数据
        //$session->setFlash('postDeleted', 'You have successfully deleted your post.');
        //echo $session->getFlash('postDeleted');
        //$session['name']='fsdf';
        //unset($session['name']);
        //echo $session['name'];die;
        /*if($session->isActive){
            echo 1;检查session是否开启
        }else{
            echo 2;
        }*/

        $model = new LoginForm();
        //var_dump($model);die;
        //$attributes = $model->attributes;
        //var_dump($attributes);die;
        //$data=Yii::$app->request->post();
        //var_dump($data);//die;
        //$model->setAttributes($data[$model->formName()]);
        //var_dump($model);die;
        //echo $model->formName();die;//调用表单名字
        //echo );die;
        //var_dump(Yii::$app->request->post());
        //
        //var_dump($model->attributes);die;
        //var_dump(Yii::$app->user);die;
        //Yii::warning("Division by zero.");
        //$model->addError('name', '用户名或密码错误！');
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            //echo 2;
            return $this->redirect(['/backend/default/index']);
        }
        //echo 3;
        return $this->render('login', [
            'model' => $model,
        ]);
    }
    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();
        return $this->redirect(['/backend/default/login']);
    }
    /**
     * @return string
     */
    public function actionEditPassword()
    {
        //类型约束不能用于标量类型如 int 或 string。Traits 也不允许。
        //1.PHP面向对象 类型约束
        //echo 1;die;
        $model = new EditPasswordForm();
        $model->user = AdminUser::findOne(Yii::$app->user->id);
        if(empty($model->user) || !($model->user instanceof AdminUser)){
            $this->addFlash('用户不存在或者已删除');
        }
        if($model->load(Yii::$app->request->post()) && $model->saveEdit()){
            //return $this->showFlash('修改成功', 'success');
        }
        //print_r($model->errors);
        return $this->render('edit-password',[
            'model'=>$model
        ]);
    }

    /**
     * 清理缓存
     * @return \yii\web\Response
     */
    public function actionClearCache()
    {
        if(Yii::$app->cache->flush()==true){
            $this->addFlash('缓存清理成功', 'info');
        }else {
            $this->addFlash('缓存清理失败');
        }
        return $this->goBack();
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        //ob_end_flush();
        //权限的问题
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
            /*'access' => [
                'class' => AccessControl::className(),
                //'actions' => ['captcha','logout', 'signup','login'],
                //'allow' => true,
                //'only' => ['captcha','logout', 'signup','login'],
                'rules' => [
                    [
                        'actions' => ['login','captcha'],
                        'allow' => true,
                        //'roles' => ['?']
                    ],
                    //['allow' => true, 'actions' => ['login', 'auth','captcha'], 'roles' => ['?']],//没这个验证码不显示
                   // ['allow' => true, 'actions' => ['login', 'auth', 'logout'], 'roles' => ['@']],
                ]
            ]*/
        ];
    }

    public function accessRules()
    {
        return array(
            /*array('allow',// allow all users to perform 'index' and 'view' actions
                'actions'=>array('captcha'),
                'users'=>array('*'),
            ),*/
           /* array('deny',  // deny all users
                'users'=>array('*'),
            ),*/
        );
    }
}
