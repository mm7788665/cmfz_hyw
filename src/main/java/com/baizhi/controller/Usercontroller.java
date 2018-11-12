package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user")
public class Usercontroller {
    @Autowired
    private UserService userService;
    @RequestMapping("register")
    public String register(User user){
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        userService.add(user);
        return  null;
    }
    @RequestMapping("login")
    public String login(User user) {
        Boolean login = userService.login(user);
        if (login) {
            return  null;
        }
        return  null;
    }
    @RequestMapping("update")
    public String update(User user){
        userService.motify(user);
        return null;
    }
}
