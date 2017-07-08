<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[BeidouType]].
 *
 * @see BeidouType
 */
class BeidouTypeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return BeidouType[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return BeidouType|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
