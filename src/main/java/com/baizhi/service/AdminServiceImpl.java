package com.baizhi.service;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Override
    public Admin queryOne(Admin admin) {
        return null;
    }

    @Override
    public List<Admin> findByPage(Integer start, Integer rows) {
        return null;
    }

    @Override
    public Long findTotals() {
        return null;
    }

    @Autowired
    private AdminDAO adminDAO;

    public void add(Admin admin) {
        admin.setId(UUID.randomUUID().toString());
        adminDAO.insert(admin);
    }

    @Override
    public void motify(Admin admin) {

    }

    @Override
    public void remove(String id) {

    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Admin> find() {
        return adminDAO.query();
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin login(Admin admin) {

        return adminDAO.login(admin);
    }

    @Override
    public void motify(String oldpassword, Admin admin) {
        Admin oldAdmin = adminDAO.queryById(admin.getId());
        if(oldAdmin.getPassword().equals(oldpassword)){
            adminDAO.update(admin);
        }else{
            throw new RuntimeException("密码错误");
        }
    }
}
