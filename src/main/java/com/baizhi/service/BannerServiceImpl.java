package com.baizhi.service;

import com.baizhi.dao.BannerDAO;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDAO bannerDAO;


    //添加
    public void add(Banner banner) {
    banner.setId(UUID.randomUUID().toString());
    banner.setDate(new Date());
    bannerDAO.insert(banner);
    }

    //修改
    public void motify(Banner banner) {
        banner.setDate(new Date());
        bannerDAO.update(banner);
    }

    //删除
    public void remove(String id) {
    bannerDAO.delete(id);
    }

    @Override
    public Banner queryOne(Banner banner) {
        return null;
    }

    //遍历
    public List<Banner> find() {
        return null;
    }
    public List<Banner> findByPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return bannerDAO.findByPage(start,rows);
    }

    public Long findTotals() {
        return bannerDAO.findTotals();
    }
}
