package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.entity.User2Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface User2RoleMapper {

    @Select("select * from user2role where userid = #{userid}")
    List<User2Role> findByUserid(@Param("userid") int userid);
}
