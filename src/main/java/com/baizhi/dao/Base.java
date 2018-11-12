package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Base<T> {
    //添加
    void insert(T t);
    //修改
    void update(T t);
    //删除
    void delete(String id);
    //查询多个
    List<T> query();
    //查询单个
    T queryOne(T t);
    //分页查询
    List<T> findByPage(@Param("start") Integer start, @Param("rows") Integer rows);
    //查询总条数
    Long findTotals();//查询总数

}
