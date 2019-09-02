package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Permission;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DeptMapper {

    @Select("select * from dept")
    List<Dept> findAll();

    @Select("select * from dept where ifnull(isuse,0) = 1")
    List<Dept> findAllByIsuse();

    @Select("select * from dept where id = #{id}")
    Dept findById(@Param("id") int id);

    @Delete("delete from dept where id = #{id}")
    int deleteById(@Param("id") int id);

    @Select("insert into dept(code, name, type, parentid,isuse,order,remark) values(#{code}, #{name}, #{type}, #{parentid}, #{isuse}, #{order}, #{remark})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertDept(Dept dept);

    @Update("update dept set code = #{code}, name = #{name}, type = #{type}, parentid = #{parentid},isuse = #{isuse},order = #{order},remark = #{remark} where id = #{id}")
    void updateDept(Dept dept);
}
