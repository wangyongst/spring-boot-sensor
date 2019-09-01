package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RoleMapper {
    @Select("select * from role where id = #{id} and ifnull(isuse,0) <>1")
    @Results(id = "userPermission", value = {
            @Result(property = "role2Permissions", column = "id", many = @Many(select = "com.spring.boot.sensor.mapper.Role2PermissionMapper.findByRoleid"))
    })
    Role findByIdAndIsuse(@Param("id") int id);

    @Select("select * from role")
    List<Role> findAll();

    @Delete("delete from role where id = #{id}")
    int deleteById(@Param("id") int id);

    @Select("select * from role where ifnull(isuse,0) = 1")
    List<Role> findAllByIsuse();
}
