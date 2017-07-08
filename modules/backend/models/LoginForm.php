<?php

namespace app\modules\backend\models;

use app\models\Category;
use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property AdminUser|null $user This property is read-only.
 *
 */
class LoginForm extends Model
{
    public $username;
    public $password;
    public $name;
    public $rememberMe = true;
    /** @var bool AdminUserIdentity */
    private $_user = false;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
            //['username','string','min'=>3,'max'=>9],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            [['username','password','name','rememberMe'],'safe'],//起一个过滤作用
            // password is validated by validatePassword()
            ['password', 'validatePassword'],
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule name-value
     */
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            //var_dump($user);die;
            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, '用户名或密码错误！');
            }
        }
    }

    /**
     * Logs in a user using the provided username and password.
     * @return bool whether the user is logged in successfully
     */
    public function login()
    {
        header('Content-type:text/html;charset=utf-8');
        //var_dump(Category::findOne(1));die;
        //var_dump(Yii::$app->user);die;
        //$this->setAttributes('username','fsf');
        //echo $this->name;die;
        //echo Yii::$app->request->post('name');
        //var_dump(Yii::$app->request->post());
        //$this->name=Yii::$app->request->post('LoginForm')['name'];

        //var_dump($this);die;
        //var_dump($this->getUser());die;
        //var_dump(Yii::$app->request->post());die;

        //$model=CategorySearch::findOne(1);//可以返回作为当前模型来调用其他的东西

        //$model=$model::ta();
        //var_dump($model);die;

        if ($this->validate()) {
            //有效日期为30天
            return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600*24*30 : 0);
        }
        return false;
    }


    /**
     * Finds user by [[username]]
     *
     * @return AdminUserIdentity|null
     */
    public function getUser()
    {
        if ($this->_user === false) {
            $this->_user = AdminUserIdentity::findByUsername($this->username);
            //var_dump(PhotosSearch::find()->one());die;//同一个模块下的模型调用不需要引用
            //var_dump(CategorySearch::find()->one());die;
            //var_dump($this->_user);die;
        }
        return $this->_user;
    }
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'username' => '用户名',
            'password' => '密码',
            'rememberMe' =>'自动登录',
        ];
    }
}
