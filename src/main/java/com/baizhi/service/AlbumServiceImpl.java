package com.baizhi.service;

import com.baizhi.dao.AlbumDAO;
import com.baizhi.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumDAO albumDAO;
    //添加
    public void add(Album album) {
        album.setId(UUID.randomUUID().toString());
        album.setPublishDate(new Date());
        albumDAO.insert(album);
    }

    //修改
    public void motify(Album album) {
    albumDAO.update(album);
    }

    //删除
    public void remove(String id) {
        albumDAO.delete(id);
    }

    //查询单个
    public Album queryOne(Album album) {
        Album album1 = albumDAO.queryOne(album);
        return album;
    }

    //查询所有
    public List<Album> find() {
        return null;
    }

    //查询所有
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findByPage(Integer page, Integer rows) {
        int start =(page-1)*rows;
        return albumDAO.findByPage(start,rows);
    }

    //总条数
    public Long findTotals() {
        return albumDAO.findTotals();
    }
}
