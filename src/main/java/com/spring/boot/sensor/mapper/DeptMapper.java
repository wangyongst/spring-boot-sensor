package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Permission;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DeptMapper {

    @Select("select * from dept order by orders asc")
    List<Dept> findAll();

    @Select("select * from dept where pId = = #{pId}")
    List<Dept> findBypID(@Param("pId") int pId);

    @Select("select * from dept where ifnull(isuse,0) = 1")
    List<Dept> findAllByIsuse();

    @Select("select * from dept where id = #{id}")
    Dept findById(@Param("id") int id);

    @Delete("delete from dept where id = #{id}")
    int deleteById(@Param("id") int id);

    @Insert("insert into dept(code, name, type, pId,isuse,orders,remark) values(#{code}, #{name}, #{type}, #{pId}, #{isuse}, #{orders}, #{remark})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertDept(Dept dept);

    @Update("update dept set code = #{code}, name = #{name}, type = #{type}, pId = #{pId},isuse = #{isuse},orders = #{orders},remark = #{remark} where id = #{id}")
    void updateDept(Dept dept);

    @Update("update dept set isuse = #{isuse} where id = #{id}")
    void updateIsuse(@Param("id") int id, @Param("isuse") int isuse);
}
