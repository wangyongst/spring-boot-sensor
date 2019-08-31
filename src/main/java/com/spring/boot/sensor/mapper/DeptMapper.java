package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface DeptMapper {
    @Select("select * from dept where id = #{id}")
    Dept findById(@Param("id") int id);

    @Select("insert into dept(deptcode, deptname, type, parentid,isuse,deptorder,remark) values(#{deptcode}, #{deptname}, #{type}, #{parentid}, #{isuse}, #{deptorder}, #{remark})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertDept(Dept dept);
}
