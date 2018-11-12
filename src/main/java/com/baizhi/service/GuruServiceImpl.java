package com.baizhi.service;

import com.baizhi.dao.GurnDAO;
import com.baizhi.entity.Gurn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceImpl implements  GuruService {
    @Autowired
    private GurnDAO gurnDAO;
    //添加
    public void add(Gurn gurn) {
        gurn.setId(UUID.randomUUID().toString());
        gurnDAO.insert(gurn);
    }

    @Override
    public void motify(Gurn gurn) {

    }

    //删除
    public void remove(String id) {
        gurnDAO.delete(id);
    }

    @Override
    public Gurn queryOne(Gurn gurn) {
        return null;
    }

    @Override
    public List<Gurn> find() {
        return null;
    }

    //遍历所有
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Gurn> findByPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return gurnDAO.findByPage(start,rows);
    }

    //总条数
    public Long findTotals() {
        return gurnDAO.findTotals();
    }
}
