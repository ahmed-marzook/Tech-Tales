--liquibase formatted SQL

--changeset ahmedM:V0001
--comment: creating a user table

-- Authors table
CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    bio TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Articles table
CREATE TABLE article (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    publishing_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    author_id INTEGER REFERENCES author(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tag (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE article_tag (
    article_id INTEGER REFERENCES article(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES tag(id) ON DELETE CASCADE,
    PRIMARY KEY (article_id, tag_id)
);

-- Indexes
CREATE INDEX idx_articles_publishing_date ON article(publishing_date);
CREATE INDEX idx_articles_author_id ON article(author_id);
CREATE INDEX idx_article_tags_article_id ON article_tag(article_id);
CREATE INDEX idx_article_tags_tag_id ON article_tag(tag_id);
CREATE INDEX idx_authors_last_name ON author(last_name);

/* liquibase rollback
rollback DROP INDEX IF EXISTS idx_article_publishing_date;
rollback DROP INDEX IF EXISTS idx_article_author_id;
rollback DROP INDEX IF EXISTS idx_article_tags_article_id;
rollback DROP INDEX IF EXISTS idx_article_tags_tag_id;
rollback DROP INDEX IF EXISTS idx_author_last_name;
rollback DROP TABLE IF EXISTS article_tag;
rollback DROP TABLE IF EXISTS tag;
rollback DROP TABLE IF EXISTS article;
rollback DROP TABLE IF EXISTS author;
*/