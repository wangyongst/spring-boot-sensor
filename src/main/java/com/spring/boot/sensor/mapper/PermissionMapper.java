package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Permission;
import com.spring.boot.sensor.entity.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PermissionMapper {
    @Select("select * from permission where id = #{id}")
    Permission findById(@Param("id") int id);

    @Select("select * from permission where id = #{id} and ifnull(isuse,0) <>1")
    Permission findByIdAndIsuse(@Param("id") int id);

    @Select("select * from permission order by orders asc")
    List<Permission> findAll();

    @Select("select * from permission where urlpath = #{urlpath}")
    List<Permission> findByUrl(String urlpath);

    @Delete("delete from permission where id = #{id}")
    int deleteById(@Param("id") int id);

    @Insert("insert into permission(pname, name, urlpath, orders,iconpath,ischeck,remark,type,pId,updatetime,isuse) values(#{pname}, #{name}, #{urlpath}, #{orders}, #{iconpath}, #{ischeck}, #{remark}, #{type}, #{pId}, #{updatetime}, #{isuse})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertPermission(Permission permission);

    @Update("update permission set pname = #{pname},name = #{name},urlpath = #{urlpath},orders = #{orders},iconpath = #{iconpath},ischeck = #{ischeck},remark = #{remark},type = #{type},pId = #{pId},updatetime = #{updatetime},isuse = #{isuse}")
    void updatePermission(Permission permission);

    @Update("update permission set isuse = #{isuse} where id = #{id}")
    void updateIsuse(@Param("id") int id, @Param("isuse") int isuse);

}
