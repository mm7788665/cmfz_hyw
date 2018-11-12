package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService extends BaseService<Admin> {
    public Admin login(Admin admin);
    public void motify(String oldpassword,Admin admin);
}
