package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select * from user where username = #{username} and ifnull(isuse,0) <>1")
    @Results(id = "userPermission", value = {
            @Result(property = "role", column = "roleid", one = @One(select = "com.spring.boot.sensor.mapper.RoleMapper.findByIdAndIsuse"))
    })
    List<User> findByUsername(@Param("username") String username);

    @Select("select * from user where id = #{id}")
    User findById(@Param("id") int id);

    @Select("select * from user")
    @Results(id = "userList", value = {
            @Result(property = "role", column = "roleid", one = @One(select = "com.spring.boot.sensor.mapper.RoleMapper.findById")),
            @Result(property = "dept", column = "deptid", one = @One(select = "com.spring.boot.sensor.mapper.DeptMapper.findById"))
    })
    List<User> findAll();

    @Delete("delete from dept where id = #{id}")
    int deleteById(@Param("id") int id);

    @Update("update user set isuse = #{isuse} where id = #{id}")
    void updateIsuse(@Param("id") int id, @Param("isuse") int isuse);
}
