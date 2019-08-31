package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.entity.User2Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface User2RoleMapper {

    @Select("select * from user2role where userid = #{userid}")
    @Results(id = "userPermission", value = {
            @Result(property = "role", column = "roleid", one = @One(select = "com.spring.boot.sensor.mapper.RoleMapper.findByIdAndIsuse"))
    })
    List<User2Role> findByUserid(@Param("userid") int userid);
}
