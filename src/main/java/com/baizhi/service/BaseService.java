package com.baizhi.service;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseService<T>{
    //添加
    void add(T t);
    //修改
    void motify(T t);
    //删除
    void remove(String id);
    //查询单个
    T queryOne(T t);
    //查询
    List<T> find();
    List<T> findByPage(@Param("start") Integer start, @Param("rows") Integer rows);

    Long findTotals();//查询总数
}
