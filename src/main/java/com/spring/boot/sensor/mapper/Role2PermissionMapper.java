package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.User2Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Role2PermissionMapper {

    @Select("select * from role2permission where roleid = #{roleid}")
    List<User2Role> findByRoleid(@Param("roleid") int roleid);
}
