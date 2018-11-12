package com.baizhi.service;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BannerService extends BaseService<Banner> {
    List<Banner> findByPage(@Param("start") Integer start, @Param("rows") Integer rows);

    Long findTotals();//查询总数
}
