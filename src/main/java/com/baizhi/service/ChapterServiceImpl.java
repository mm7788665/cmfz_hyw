package com.baizhi.service;

import com.baizhi.dao.ChapterDAO;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService{
    @Autowired
    private ChapterDAO chapterDAO;
    public void add(Chapter chapter) {
        chapter.setId(UUID.randomUUID().toString());
        chapter.setUploadTime(new Date());
        chapterDAO.insert(chapter);
    }

    @Override
    public void motify(Chapter chapter) {

    }

    @Override
    public void remove(String id) {
    chapterDAO.delete(id);
    }

    @Override
    public Chapter queryOne(Chapter chapter) {
        return null;
    }

    @Override
    public List<Chapter> find() {
        return null;
    }

    @Override
    public List<Chapter> findByPage(Integer page, Integer rows) {
        int start =(page-1)*rows;
        return chapterDAO.findByPage(start,rows);
    }

    @Override
    public Long findTotals() {
        return chapterDAO.findTotals();
    }
}
