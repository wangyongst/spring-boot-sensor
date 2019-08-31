package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Permission;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DeptMapper {

    @Select("select * from dept")
    List<Dept> findAll();

    @Select("select * from dept where id = #{id}")
    Dept findById(@Param("id") int id);

    @Delete("delete from dept where id = #{id}")
    int deleteById(@Param("id") int id);

    @Select("insert into dept(deptcode, deptname, type, parentid,isuse,deptorder,remark) values(#{deptcode}, #{deptname}, #{type}, #{parentid}, #{isuse}, #{deptorder}, #{remark})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertDept(Dept dept);

    @Update("update dept set deptcode = #{deptcode}, deptname = #{deptname}, type = #{type}, parentid = #{parentid},isuse = #{isuse},deptorder = #{deptorder},remark = #{remark} where id = #{id}")
    void updateDept(Dept dept);
}
