package com.baizhi.service;

import com.baizhi.dao.UserDAO;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;
    @Transactional(propagation = Propagation.SUPPORTS)
    public Boolean login(User user) {
        User users = userDAO.queryOne(user);
        if(users!=null){
            return true;
        }
        return false;
    }

    @Override
    public void add(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setDate(new Date());
        userDAO.insert(user);
    }

    @Override
    public void motify(User user) {
        userDAO.update(user);
    }

    @Override
    public void remove(String id) {

    }

    @Override
    public User queryOne(User user) {
        return null;
    }

    @Override
    public List<User> find() {
        return null;
    }

    @Override
    public List<User> findByPage(Integer start, Integer rows) {
        return null;
    }

    @Override
    public Long findTotals() {
        return null;
    }
}
