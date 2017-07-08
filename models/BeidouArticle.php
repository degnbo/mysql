<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%beidou_article}}".
 *
 * @property string $id
 * @property integer $type_id
 * @property string $cate_id
 * @property string $is_show
 * @property string $is_rec
 * @property string $is_hot
 * @property string $addtime
 * @property string $uptime
 * @property string $title
 * @property string $des
 * @property string $keywords
 * @property string $alias
 * @property string $content
 * @property integer $hits
 * @property string $author
 * @property integer $sort_num
 * @property string $logo
 * @property string $thumb_logo
 * @property string $model_name
 * @property integer $width
 * @property integer $height
 * @property string $url
 * @property string $url_name
 * @property string $colorval
 * @property string $boldval
 * @property integer $cid
 */
class BeidouArticle extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%beidou_article}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type_id', 'cate_id', 'addtime', 'uptime', 'hits', 'sort_num', 'width', 'height', 'cid'], 'integer'],
            [['cate_id', 'addtime', 'uptime', 'title', 'des', 'keywords', 'alias', 'content', 'sort_num', 'logo', 'thumb_logo', 'width', 'height', 'url', 'url_name', 'colorval', 'boldval', 'cid'], 'required'],
            [['is_show', 'is_rec', 'is_hot', 'content', 'url', 'url_name'], 'string'],
            [['title', 'alias'], 'string', 'max' => 30],
            [['des'], 'string', 'max' => 500],
            [['keywords', 'logo', 'thumb_logo', 'colorval', 'boldval'], 'string', 'max' => 100],
            [['author'], 'string', 'max' => 20],
            [['model_name'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', '文章id'),
            'type_id' => Yii::t('app', '类型id'),
            'cate_id' => Yii::t('app', '栏目id'),
            'is_show' => Yii::t('app', '是否显示'),
            'is_rec' => Yii::t('app', '是否推荐'),
            'is_hot' => Yii::t('app', 'Is Hot'),
            'addtime' => Yii::t('app', '添加时间'),
            'uptime' => Yii::t('app', '修改时间'),
            'title' => Yii::t('app', '文章标题'),
            'des' => Yii::t('app', '文章描述'),
            'keywords' => Yii::t('app', '文章关键字'),
            'alias' => Yii::t('app', '标题别名'),
            'content' => Yii::t('app', '文章内容'),
            'hits' => Yii::t('app', '点击量'),
            'author' => Yii::t('app', '作者/发布者'),
            'sort_num' => Yii::t('app', '排序'),
            'logo' => Yii::t('app', '文章logo'),
            'thumb_logo' => Yii::t('app', '缩略logo'),
            'model_name' => Yii::t('app', '模块名称'),
            'width' => Yii::t('app', 'Width'),
            'height' => Yii::t('app', 'Height'),
            'url' => Yii::t('app', '图集路径'),
            'url_name' => Yii::t('app', '图集名称'),
            'colorval' => Yii::t('app', '颜色值'),
            'boldval' => Yii::t('app', '粗体值'),
            'cid' => Yii::t('app', '课程分类id'),
        ];
    }
    public function getRecord(){
        return $this->hasOne(BeidouType::className(),['id'=>'type_id']);
    }

    /**
     * @inheritdoc
     * @return BeidouArticleQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new BeidouArticleQuery(get_called_class());
    }
}
