package com.kaizenflow.techtales.entity

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.Id
import jakarta.persistence.Table

@Entity
@Table(name = "tag")
class Tag(
    @GeneratedValue @Id var id: Long,
    var name: String,
)
