package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface DeptMapper {
    @Select("select * from dept where id = #{id}")
    Dept findById(@Param("id") int id);

    @Select("insert into dept(id, code, name, type, parentid,isuse,order,remark) values(#{id}, #{code}, #{name}, #{type}, #{parentid}, #{isuse}, #{order}, #{remark})")
    void insertDept(Dept dept);
}
