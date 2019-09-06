package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Logs;
import com.spring.boot.sensor.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface LogsMapper {
    @Select("select * from logs order by createtime desc")
    List<Logs> findAll();

    @Insert("insert into logs(method, name, userusername, username,url,ip,createtime) values(#{method}, #{name}, #{userusername}, #{username}, #{url},#{ip}, #{createtime})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertLogs(Logs logs);
}
