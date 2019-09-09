package com.spring.boot.sensor.service;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.utils.result.Result;

import java.util.List;

public interface AdminService {

    Result check(ParameterM parameterM);

    Result userLogin(String username, String password);

    Result findByUsername(String username);

    Result dept(ParameterM parameterM);

    Result deptList(ParameterM parameterM);

    Result deptSud(ParameterM parameterM);

    Result permissionList(ParameterM parameterM);

    Result permission(ParameterM parameterM);

    Result permissionSud(ParameterM parameterM);

    Result userList(ParameterM parameterM);

    Result user(ParameterM parameterM);

    Result userSud(ParameterM parameterM);

    Result roleList(ParameterM parameterM);

    Result role(ParameterM parameterM);

    Result roleSud(ParameterM parameterM);

    Result rolePermission(ParameterM parameterM);

    Result isInBlack(String ip);

    Result blacklist(int type);

    Result blacklistSud(ParameterM parameterM);

    Result createLog(String method, String path, String ip);

    Result logsList(ParameterM parameterM);

}
