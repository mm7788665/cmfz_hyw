package com.baizhi.service;

import com.baizhi.dao.ArticleDAO;
import com.baizhi.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    private ArticleDAO articleDAO;

    @Override
    public void add(Article article) {
    article.setId(UUID.randomUUID().toString());
    article.setPublishDate(new Date());
    articleDAO.insert(article);
    }

    @Override
    public void motify(Article article) {
    }

    @Override
    public void remove(String id) {
    articleDAO.delete(id);
    }

    @Override
    public Article queryOne(Article article) {
        return null;
    }

    @Override
    public List<Article> find() {
        return null;
    }

    @Override
    public List<Article> findByPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return articleDAO.findByPage(start,rows);
    }

    @Override
    public Long findTotals() {
        return articleDAO.findTotals();
    }
}
