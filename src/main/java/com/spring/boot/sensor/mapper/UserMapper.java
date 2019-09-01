package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select * from user where username = #{username} and ifnull(isuse,0) <>1")
    @Results(id = "userPermission", value = {
            @Result(property = "user2Roles", column = "id", many = @Many(select = "com.spring.boot.sensor.mapper.User2RoleMapper.findByUserid"))
    })
    List<User> findByUsername(@Param("username") String username);

    @Select("select * from user where id = #{id}")
    User findById(@Param("id") int id);

    @Select("select * from user")
    List<User> findAll();

    @Delete("delete from dept where id = #{id}")
    int deleteById(@Param("id") int id);
}
