<?php

namespace app\modules\backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Category;
use yii\helpers\ArrayHelper;

/**
 * CategorySearch represents the model behind the search form about `app\models\Category`.
 */
class CategorySearch extends Category
{
    //为什么编写这个呢，因为数据库没有这个验证码这个字段
    //所以添加属性之后就可以了
    public $verifyCode;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid','id','type','name'], 'required'],
            //[['id', 'pid', 'type'], 'integer'],
            //[['image'], 'file', 'maxFiles' => 10],
            ['verifyCode','required','message'=>'验证码错误1'],
            ['verifyCode', 'captcha'],
            [['name', 'created_at', 'updated_at','verifyCode'], 'safe'],
            //[['file'], 'file','skipOnEmpty' => false,'extensions' => 'jpg, png', 'mimeTypes' => 'image/jpeg, image/png','maxFiles' => 10],
        ];
    }


    /*public function behaviors()
    {
        //echo
        return [
            [
                'class'=>UploadBehavior::className(),
                'saveDir'=>'photos/'
            ]
        ];
    }*/

    public static function ta()
    {
        echo 2;
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }
    /**
     * 获取取全部 分类
     * @param array $params
     * @param return array
     * @return array
     */
    public function listData($params)
    {
        $this->load($params);
        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return [];
        }
        $query = Category::find();

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'pid' => $this->pid,
            'type' => $this->type,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);
        $query->orderBy('pid asc, id asc');
        // add conditions that should always apply here
        return $query->asArray()->all();
    }
    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Category::find();

        $activeDataProvider =  new ActiveDataProvider([
            'query' =>$query,
            'pagination' => [
                'pageSize' => 2,
            ],
        ]);
        $this->load($params);
        //var_dump($activeDataProvider);die;
        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $activeDataProvider;
        }
        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'pid' => $this->pid,
            'type' => $this->type,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);
        $createAt = $this->getCreatedAt();
        //var_dump($createAt);die;
        if(is_array($createAt)) {
            $query->andFilterWhere(['>=','created_at', $createAt[0]])
                ->andFilterWhere(['<=','created_at', $createAt[1]]);
        }else{
            $query->andFilterWhere(['created_at'=>$createAt]);
        }
        // add conditions that should always apply here
        return $activeDataProvider;
    }
}
