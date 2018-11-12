package com.baizhi.service;

import com.baizhi.dao.MenuDAO;
import com.baizhi.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDAO menuDAO;

    @Override
    public Menu queryOne(Menu menu) {
        return null;
    }

    @Override
    public List<Menu> findByPage(Integer start, Integer rows) {
        return null;
    }

    @Override
    public Long findTotals() {
        return null;
    }

    public void add(Menu menu) {

    }

    @Override
    public void motify(Menu menu) {

    }

    @Override
    public void remove(String id) {

    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Menu> find() {
        return menuDAO.query();
    }
}
