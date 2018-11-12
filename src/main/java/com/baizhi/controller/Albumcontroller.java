package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
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
@RequestMapping("album")
public class Albumcontroller {
    @Autowired
    private AlbumService albumService;
    @RequestMapping("findAll")
    @ResponseBody
    public Map<String,Object> save(Integer page, Integer rows){
        HashMap<String, Object> results = new HashMap<>();
        List<Album> byPage = albumService.findByPage(page, rows);
        System.out.println(byPage);
        Long totals = albumService.findTotals();
        results.put("total",totals);
        results.put("rows",byPage);

        return results;
    }
    @RequestMapping("delete")
    @ResponseBody
    public Map<String,Object> delete(String [] id){
        HashMap<String, Object> map = new HashMap<>();
        try {
            for (String s : id) {
               albumService.remove(s);
            }
            map.put("success",true);
            }catch (Exception e){
                e.printStackTrace();
                map.put("success",false);
                map.put("message",e.getMessage());
        }
        return map;
    }
    @RequestMapping("save")
    @ResponseBody
    public Map<String,Object> save(Album album, HttpSession session, MultipartFile addFile){
        HashMap<String, Object> map = new HashMap<>();
        try {
            String img = session.getServletContext().getRealPath("/back/main/album/img");
            addFile.transferTo(new File(img,addFile.getOriginalFilename()));
            album.setCoverImg("/img/"+addFile.getOriginalFilename());
            albumService.add(album);
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("Message",e.getMessage());
        }
        return map;
    }

}
