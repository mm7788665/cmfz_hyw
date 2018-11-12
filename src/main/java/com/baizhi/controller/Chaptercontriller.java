package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import com.baizhi.util.DurationUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("chapter")
public class Chaptercontriller {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("save")
    @ResponseBody
    public String save(MultipartFile file, HttpServletRequest request, Chapter chapter) throws IOException {
        System.out.println(file);
        System.out.println(chapter);
        String realPath = request.getSession().getServletContext().getRealPath("/back/main/album/music");//获取文件绝对路径
        file.transferTo(new File(realPath,file.getOriginalFilename()));//上传音频
        Double dou = file.getSize()/1024.0/1024.0;//转换为M级别
        dou = (double)Math.round(dou*100)/100;//获取小数点后两位
        File filee = new File(realPath+"/"+file.getOriginalFilename());//获取音频
        String time = DurationUtil.getVideoTime(filee);//调用工具类获取时长
        chapter.setDownPath("back/main/album/music/"+file.getOriginalFilename());//设置下载路径
        chapter.setDuration(time);//设置时长
        chapter.setSize(dou.toString()+"M");//设置文件大小
        chapterService.add(chapter);//保存章节
        return null;
    }

    @RequestMapping("findAll")
    @ResponseBody
    public Map<String,Object> findAll(Integer page,Integer rows){
        HashMap<String, Object> results = new HashMap<>();
        List<Chapter> byPage = chapterService.findByPage(page, rows);
        Long totals = chapterService.findTotals();
        results.put("success",totals);
        results.put("success",byPage);
        return results;
    }
    @RequestMapping("delete")
    @ResponseBody
    public Map<String,Object> delete(String []id){
        HashMap<String, Object> map = new HashMap<>();
        try {
            for (String s : id) {
                chapterService.remove(s);
            }
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("message",e.getMessage());

        }
        return  map;
    }
    @RequestMapping("/download")
    public void download(String fileName, String openStyle, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //1.根据接收的文件名去服务中指定目录读取文件
        System.out.println(fileName+"filename");
        System.out.println(openStyle+"openstyle");
        String realPath = request.getSession().getServletContext().getRealPath("/back/main/album/music");
        String filenames[] = fileName.toString().split("/");
        String filename = filenames[filenames.length-1];
        //2.以文件输入流读取文件
        FileInputStream is = new FileInputStream(new File(realPath, filename));
        //2.1 设置响应头
        response.setHeader("content-disposition", openStyle+";fileName=" + URLEncoder.encode(fileName, "UTF-8"));
        //3.获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //4.使用IOUtils工具类
        IOUtils.copy(is, os);
        //5.关流
        IOUtils.closeQuietly(is);//安静关流
        IOUtils.closeQuietly(os);

    }
}
