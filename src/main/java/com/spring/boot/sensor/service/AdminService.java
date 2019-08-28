package com.spring.boot.sensor.service;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.utils.result.Result;

import java.util.List;

public interface AdminService {

    //    Result me();
//
    Result findByUsername(String username);

    Result deptSud(ParameterM parameterM);

//
//    Result userList(ParameterM parameterM);
//
//    Result roleList(ParameterM parameterM);
//
//    Result user(ParameterM parameterM);
//
//    Result userSud(ParameterM parameterM);
//
//    Result role(ParameterM parameterM);
//
//    Result roleSud(ParameterM parameterM);
//
//    Result permissionList(ParameterM parameterM);
//
//    Result changePassword(ParameterM parameterM);
//
//    void deleteRole(Role role);

}
