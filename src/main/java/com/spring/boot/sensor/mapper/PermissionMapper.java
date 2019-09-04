package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Permission;
import com.spring.boot.sensor.entity.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PermissionMapper {
    @Select("select * from permission where id = #{id}")
    Permission findById(@Param("id") int id);

    @Select("select * from permission where id = #{id} and ifnull(isuse,0) <>1")
    Permission findByIdAndIsuse(@Param("id") int id);

    @Select("select * from permission")
    List<Permission> findAll();

    @Select("select * from permission where urlpath = #{urlpath}")
    List<Permission> findByUrl(String urlpath);
}
