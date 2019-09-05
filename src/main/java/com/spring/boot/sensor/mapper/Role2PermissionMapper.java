package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Role2Permission;
import com.spring.boot.sensor.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface Role2PermissionMapper {

    @Select("select * from role2permission where roleid = #{roleid}")
    @Results(id = "userPermission", value = {
            @Result(property = "permission", column = "permissionid", one = @One(select = "com.spring.boot.sensor.mapper.PermissionMapper.findByIdAndIsuse"))
    })
    List<Role2Permission> findByRoleid(@Param("roleid") int roleid);


    @Delete("delete from role2permission where roleid = #{roleid}")
    void deleteByRoleid(@Param("roleid") int roleid);

    @Select("insert into role2permission (roleid, permissionid) values(#{roleid}, #{permissionid})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertRole2Permission(Role2Permission role2Permission);
}
