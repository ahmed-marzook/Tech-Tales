package com.kaizenflow.techtales.entity

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.FetchType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.Id
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne
import jakarta.persistence.Table
import org.hibernate.annotations.CreationTimestamp
import org.hibernate.annotations.UpdateTimestamp
import java.time.ZonedDateTime

@Entity
@Table(name = "article")
class Article(
    @GeneratedValue @Id var id: Long? = null,
    @Column(nullable = false)
    var title: String,
    @Column(nullable = false)
    var content: String,
    var publishingDate: ZonedDateTime,
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id")
    var author: Author,
    @CreationTimestamp
    var createdAt: ZonedDateTime,
    @UpdateTimestamp
    var updatedAt: ZonedDateTime,
)
