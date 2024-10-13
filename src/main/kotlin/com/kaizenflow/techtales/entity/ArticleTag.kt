package com.kaizenflow.techtales.entity

import jakarta.persistence.Entity

@Entity
class ArticleTag(
    var article: Article,
    var tag: Tag,
)
