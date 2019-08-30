package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RoleMapper {
    @Select("select * from role where id = #{id}")
    @Results(id = "userPermission", value = {
            @Result(property = "role2Permissions", column = "id", many = @Many(select = "com.spring.boot.sensor.mapper.Role2PermissionMapper.findByRoleid"))
    })
    Role findById(@Param("id") int id);
}
