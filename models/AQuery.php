<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[AdminMenu]].
 *
 * @see AdminMenu
 */
class AQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return AdminMenu[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return AdminMenu|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
