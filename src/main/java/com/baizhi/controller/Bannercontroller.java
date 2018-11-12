package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("banner")
public class Bannercontroller {
    @Autowired
    private BannerService bannerService;

    //分页查询用户
    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page, Integer rows){
        Map<String,Object> results = new HashMap<String,Object>();
        //当前页数据rows:
        List<Banner> carousels = bannerService.findByPage(page, rows);

        //总记录数
        Long totals = bannerService.findTotals();
        results.put("total",totals);
        results.put("rows",carousels);

        return results;
    }
    @RequestMapping("update")
    @ResponseBody
    public Map<String,Object> update(Banner banner){
        HashMap<String, Object> map = new HashMap<>();
        try {
            bannerService.motify(banner);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }
    @RequestMapping("save")
    @ResponseBody
    public Map<String,Object> save(Banner banner){
        HashMap<String, Object> results = new HashMap<>();
        try {
            bannerService.add(banner);
            results.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return  results;
    }
    @RequestMapping("delete")
    @ResponseBody
    public Map<String,Object> delete(String[] id){
        HashMap<String, Object> map = new HashMap<>();
        try {
            for (String s : id) {
                bannerService.remove(s);

            }
            map.put("success",true);

        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }
}
