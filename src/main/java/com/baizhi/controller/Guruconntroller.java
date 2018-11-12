package com.baizhi.controller;

import com.baizhi.entity.Gurn;
import com.baizhi.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("guru")
public class Guruconntroller {
    @Autowired
    private GuruService guruService;
    @RequestMapping("save")
    @ResponseBody
    public Map<String,Object> save(Gurn gurn, HttpSession session, MultipartFile file){
        HashMap<String, Object> results = new HashMap<>();
        try {
            String img = session.getServletContext().getRealPath("/back/main/img");
            file.transferTo(new File(img,file.getOriginalFilename()));
            gurn.setHeadPic("/img/"+file.getOriginalFilename());
            guruService.add(gurn);
            results.put("success",true);
            return results;
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("findAll")
    @ResponseBody
    public Map<String,Object> findAll(Integer page,Integer rows){
        HashMap<String, Object> results = new HashMap<>();
        List<Gurn> byPage = guruService.findByPage(page,rows);
        Long totals = guruService.findTotals();
        results.put("total",totals);
        results.put("rows",byPage);
        return  results;

    }
    @RequestMapping("delete")
    @ResponseBody
    public Map<String,Object> delete(String []id){
        HashMap<String, Object> map = new HashMap<>();
        try {
            for (String s : id) {
                guruService.remove(s);
            }
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());
        }
        return map;
    }
}
