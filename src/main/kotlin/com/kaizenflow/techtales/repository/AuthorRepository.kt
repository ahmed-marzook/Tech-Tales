package com.kaizenflow.techtales.repository

import com.kaizenflow.techtales.entity.Author
import org.springframework.data.jpa.repository.JpaRepository

interface AuthorRepository : JpaRepository<Author, Long> {

}
