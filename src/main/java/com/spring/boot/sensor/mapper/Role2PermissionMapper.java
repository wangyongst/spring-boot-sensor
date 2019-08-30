package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Role2Permission;
import com.spring.boot.sensor.entity.User2Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface Role2PermissionMapper {

    @Select("select * from role2permission where roleid = #{roleid}")
    @Results(id = "userPermission", value = {
            @Result(property = "permission", column = "permissionid", one = @One(select = "com.spring.boot.sensor.mapper.PermissionMapper.findById"))
    })
    List<Role2Permission> findByRoleid(@Param("roleid") int roleid);
}
