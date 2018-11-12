package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class Admincontroller {
    @Autowired
    private AdminService adminService;
    //添加
    @RequestMapping("save")
    public String regist(Admin admin){
        adminService.add(admin);
        return "redirect:back/main/login.jsp";
    }
    //修改
   @RequestMapping("update")
    @ResponseBody
    public void update(Admin admin, String oldpassword){
        adminService.motify(oldpassword,admin);
    }
    @RequestMapping("login")
    public String login(String code,Admin admin,HttpServletRequest request){
        HttpSession session = request.getSession();
        String validationCode = (String)session.getAttribute("validationCode");
        Admin login = adminService.login(admin);
        if(validationCode.equals(code)){
            if (login!=null){
            session.setAttribute("login",login);
                return "redirect:/back/main/main/main.jsp";

            }
            return "redirect:/back/main/login.jsp";
        }
        return "redirect:/back/main/login.jsp";
    }
    //退出系统
    @RequestMapping("/exit")
    public String exit(HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        session.removeAttribute("login");
        return "redirect:/back/main/login.jsp";
    }

}
