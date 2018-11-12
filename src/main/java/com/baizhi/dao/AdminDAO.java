package com.baizhi.dao;

import com.baizhi.entity.Admin;

public interface AdminDAO extends Base<Admin>{
    public Admin login(Admin admin);
    void  update1(Admin admin);
    Admin queryOne(Admin admin);
    Admin queryById(String id);
}
