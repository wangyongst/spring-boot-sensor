package com.spring.boot.sensor.config.shiro;

import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.entity.Role2Permission;
import com.spring.boot.sensor.entity.User;
import com.spring.boot.sensor.service.AdminService;
import com.spring.boot.sensor.utils.result.Result;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private AdminService adminService;

    //权限信息，包括角色以及权限
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        User user = (User) principals.getPrimaryPrincipal();
        Role role = user.getRole();
        if(role != null) {
            authorizationInfo.addRole(role.getRname());
            for (Role2Permission p : role.getRole2Permissions()) {
                authorizationInfo.addStringPermission(p.getPermission().getPname());
            }
        }
        return authorizationInfo;
    }

    //身份认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        User user = null;
        Result result = adminService.findByUsername(username);
        if (result.getStatus() == 1) user = (User) result.getData();
        else throw new AuthenticationException();
        if (user == null) {
            throw new AuthenticationException();
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(), getName());
        return authenticationInfo;
    }
}