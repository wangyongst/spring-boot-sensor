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

    @Select("select * from user where username = #{username}")
    List<User> findByUsernameCheck(@Param("username") String username);


    @Select("select * from user where id = #{id}")
    User findById(@Param("id") int id);

    @Select("select * from user")
    @Results(id = "userList", value = {
            @Result(property = "role", column = "roleid", one = @One(select = "com.spring.boot.sensor.mapper.RoleMapper.findById")),
            @Result(property = "dept", column = "deptid", one = @One(select = "com.spring.boot.sensor.mapper.DeptMapper.findById"))
    })
    List<User> findAll();

    @Delete("delete from user where id = #{id}")
    int deleteById(@Param("id") int id);

    @Update("update user set isuse = #{isuse} where id = #{id}")
    void updateIsuse(@Param("id") int id, @Param("isuse") int isuse);

    @Update("update user set roleid = null where roleid = #{roleid}")
    void updateRoleid(@Param("roleid") int roleid);

    @Select("insert into user(username, name, finger, password,workno,mobile,telephone,email, remark, isuse, deptid,roleid) values(#{username}, #{name}, #{finger}, #{password},#{workno},#{mobile},#{telephone},#{email}, #{remark}, #{isuse}, #{deptid},#{roleid})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertUser(User user);

    @Update("update user set username = #{username},name  = #{name},finger  = #{finger}, password = #{password},workno = #{workno},mobile = #{mobile},telephone = #{telephone},email = #{email},remark  = #{remark}, isuse = #{isuse},deptid  = #{deptid},roleid = #{roleid} where id = #{id}")
    void updateUser(User user);

    @Update("update user set pwtime = #{pwtime} where id = #{id}")
    void updatePwtime(int id, String pwtime);

    @Update("update user set errortime = #{errortime} where id = #{id}")
    void updateErrortime(int id, int errortime);
}
