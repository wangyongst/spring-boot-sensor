package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Permission;
import com.spring.boot.sensor.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PermissionMapper {
    @Select("select * from permission where id = #{id}")
    Permission findById(@Param("id") int id);
}
