<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%beidou_type}}".
 *
 * @property string $id
 * @property string $tname
 * @property integer $cate_id
 */
class BeidouType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%beidou_type}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tname', 'cate_id'], 'required'],
            [['cate_id'], 'integer'],
            [['tname'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', '类型id'),
            'tname' => Yii::t('app', '类型名称'),
            'cate_id' => Yii::t('app', '栏目id'),
        ];
    }

    /**
     * @inheritdoc
     * @return BeidouTypeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new BeidouTypeQuery(get_called_class());
    }
}
