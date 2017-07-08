<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[BeidouArticle]].
 *
 * @see BeidouArticle
 */
class BeidouArticleQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return BeidouArticle[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return BeidouArticle|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
