package com.kaizenflow.techtales.entity

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.Id
import jakarta.persistence.Table
import org.hibernate.annotations.CreationTimestamp
import org.hibernate.annotations.UpdateTimestamp
import java.time.ZonedDateTime

@Entity
@Table(name = "author")
class Author(
    @GeneratedValue @Id var id: Long,
    @Column(nullable = false)
    var firstName: String,
    @Column(nullable = false)
    var lastName: String,
    @Column(nullable = false)
    var email: String,
    @Column(nullable = false)
    var bio: String,
    @CreationTimestamp
    var createdAt: ZonedDateTime,
    @UpdateTimestamp
    var updatedAt: ZonedDateTime,
)
