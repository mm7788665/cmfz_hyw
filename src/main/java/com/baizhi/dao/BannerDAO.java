package com.baizhi.dao;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BannerDAO extends Base<Banner>{
    List<Banner> findByPage(@Param("start") Integer start, @Param("rows") Integer rows);

    Long findTotals();//查询总数

}
