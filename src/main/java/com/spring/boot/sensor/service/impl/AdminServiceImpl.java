package com.spring.boot.sensor.service.impl;

import com.spring.boot.sensor.entity.*;
import com.spring.boot.sensor.mapper.*;
import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.service.AdminService;
import com.spring.boot.sensor.utils.SM3Utils;
import com.spring.boot.sensor.utils.db.TimeUtils;
import com.spring.boot.sensor.utils.result.Result;
import com.spring.boot.sensor.utils.result.ResultUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.List;

@Service
@SuppressWarnings("All")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class, readOnly = false)
public class AdminServiceImpl implements AdminService {

    private static final Logger logger = LogManager.getLogger(AdminServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private Role2PermissionMapper role2PermissionMapper;

    @Autowired
    private BlacklistMapper blacklistMapper;

    @Autowired
    private LogsMapper logsMapper;

    @Override
    public Result check(ParameterM parameterM) {
        if (StringUtils.isBlank(parameterM.getPassword())) return ResultUtil.errorWithMessage("监护人密码不能为空");
        String newpassword = SM3Utils.encrypt(parameterM.getPassword());
        List<User> userList = userMapper.findJianHuRen(newpassword);
        if (userList != null && userList.size() > 0) return ResultUtil.ok();
        else return ResultUtil.errorWithMessage("监护人密码不正确");
    }

    @Override
    public Result userLogin(String username, String password) {
        List<User> userList = userMapper.findByUsername(username);
        User user = null;
        if (userList == null || userList.size() == 0) return ResultUtil.errorWithMessage("用户名不存在");
        else user = userList.get(0);
        if (user.getIslock() != null && user.getIslock() == 1) return ResultUtil.ok();
        if (user.getIsuse() != null) return ResultUtil.errorWithMessage("账号失效不能登录");
        String loginPassword = new Md5Hash(password).toHex();
        if (!user.getPassword().equals(loginPassword)) {
            int errortime = 1;
            if (user.getErrortime() != null) errortime = user.getErrortime() + 1;
            if (errortime <= 5) {
                userMapper.updateErrortime(user.getId(), errortime);
                return ResultUtil.errorWithMessage("密码错误,连续错误5次，账号将被锁定");
            } else {
                userMapper.updateErrortime(user.getId(), 0);
                userMapper.updateIsuse(user.getId(), 1);
                return ResultUtil.errorWithMessage("密码连续错误5次，账号被锁定");
            }
        }
        userMapper.updateErrortime(user.getId(), 0);
        try {
            if ((System.currentTimeMillis() - TimeUtils.parse(user.getPwtime())) > 1000 * 60 * 60 * 24 * 30) {
                userMapper.updateIsuse(user.getId(), 1);
                return ResultUtil.errorWithMessage("密码超过有效期不能登录");
            }
        } catch (ParseException e) {
            e.printStackTrace();
            return ResultUtil.errorWithMessage("登录失败");
        }
        return ResultUtil.ok();
    }

    @Override
    public Result findByUsername(String username) {
        List<User> userList = userMapper.findByUsername(username);
        if (userList.size() == 1) return ResultUtil.okWithData(userList.get(0));
        return null;
    }

    @Override
    public Result dept(ParameterM parameterM) {
        return ResultUtil.okWithData(deptMapper.findById(parameterM.getId()));
    }

    @Override
    public Result deptSud(ParameterM parameterM) {
        if (parameterM.getDelete() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            if (parameterM.getIds().split(",").length > 1) return ResultUtil.errorWithMessage("只能选择一条数据");
            List<Dept> deptList = deptMapper.findBypID(Integer.parseInt(parameterM.getIds()));
            if (deptList != null && deptList.size() > 0) return ResultUtil.errorWithMessage("有下级的组织不能删除");
            List<User> userList = userMapper.findByDeptid(Integer.parseInt(parameterM.getIds()));
            if (userList != null && userList.size() > 0) return ResultUtil.errorWithMessage("有用户的组织不能删除");
            deptMapper.deleteById(Integer.parseInt(parameterM.getIds()));
            return ResultUtil.ok();
        }
        if (parameterM.getDelete() == 2) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                deptMapper.deleteById(Integer.parseInt(id));
            }
            return ResultUtil.ok();
        }
        if (parameterM.getLock() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                deptMapper.updateIsuse(Integer.parseInt(id), 1);
            }
            return ResultUtil.ok();
        }
        if (!StringUtils.isNumeric(parameterM.getOrders())) return ResultUtil.errorWithMessage("排序只能是数字");
        if (StringUtils.isBlank(parameterM.getCode())) return ResultUtil.errorWithMessage("组织编码不能为空");
        if (StringUtils.isBlank(parameterM.getName())) return ResultUtil.errorWithMessage("组织名称不能为空");
        Dept dept = null;
        if (parameterM.getId() != 0) dept = deptMapper.findById(parameterM.getId());
        else if (parameterM.getId() == 0) dept = new Dept();
        dept.setCode(parameterM.getCode());
        dept.setIsuse(parameterM.getIsuse());
        dept.setOrders(Integer.parseInt(parameterM.getOrders()));
        dept.setRemark(parameterM.getRemark());
        dept.setName(parameterM.getName());
        dept.setpId(Integer.parseInt(parameterM.getpId()));
        dept.setType(parameterM.getType());
        if (dept.getId() != 0) {
            deptMapper.updateDept(dept);
            return ResultUtil.ok();
        } else {
            deptMapper.insertDept(dept);
        }
        return ResultUtil.ok();
    }

    @Override
    public Result deptList(ParameterM parameterM) {
        return ResultUtil.okWithData(deptMapper.findAll());
    }


    @Override
    public Result permissionSud(ParameterM parameterM) {
        if (parameterM.getDelete() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            if (parameterM.getIds().split(",").length > 1) return ResultUtil.errorWithMessage("只能选择一条数据");
            Permission permission = permissionMapper.findById(Integer.parseInt(parameterM.getIds()));
            if (permission.getIslock() != null && permission.getIslock() == 1)
                return ResultUtil.errorWithMessage("不能删除内置权限");
            if (permissionMapper.findBypId(permission.getId()).size() > 0)
                return ResultUtil.errorWithMessage("有子节点不能删除");
            permissionMapper.deleteById(Integer.parseInt(parameterM.getIds()));
            role2PermissionMapper.deleteByPermissionid(Integer.parseInt(parameterM.getIds()));
            return ResultUtil.ok();
        }
        if (parameterM.getDelete() == 2) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                Permission permission = permissionMapper.findById(Integer.parseInt(id));
                if (permission.getIslock() != null && permission.getIslock() == 1)
                    return ResultUtil.errorWithMessage("不能删除内置权限");
                if (permissionMapper.findBypId(permission.getId()).size() > 0)
                    return ResultUtil.errorWithMessage("有子节点不能删除");
                permissionMapper.deleteById(Integer.parseInt(id));
                role2PermissionMapper.deleteByPermissionid(Integer.parseInt(parameterM.getIds()));
            }
            return ResultUtil.ok();
        }
        if (parameterM.getLock() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                permissionMapper.updateIsuse(Integer.parseInt(id), 1);
            }
            return ResultUtil.ok();
        }
        if (!StringUtils.isNumeric(parameterM.getOrders())) return ResultUtil.errorWithMessage("排序只能是数字");
        if (StringUtils.isBlank(parameterM.getPname())) return ResultUtil.errorWithMessage("名称标识不能为空");
        Permission permission = null;
        if (parameterM.getId() != 0) permission = permissionMapper.findById(parameterM.getId());
        else if (parameterM.getId() == 0) permission = new Permission();
        permission.setPname(parameterM.getPname());
        if (StringUtils.isNotBlank(parameterM.getpId())) permission.setpId(Integer.parseInt(parameterM.getpId()));
        permission.setIsuse(parameterM.getIsuse());
        permission.setOrders(Integer.parseInt(parameterM.getOrders()));
        permission.setRemark(parameterM.getRemark());
        permission.setName(parameterM.getName());
        if (StringUtils.isBlank(parameterM.getpId())) permission.setpId(null);
        else permission.setpId(Integer.parseInt(parameterM.getpId()));
        permission.setType(Integer.parseInt(parameterM.getType()));
        if (parameterM.getId() != 0) {
            permissionMapper.updatePermission(permission);
            return ResultUtil.ok();
        } else {
            permissionMapper.insertPermission(permission);
        }
        return ResultUtil.ok();
    }

    @Override
    public Result permissionList(ParameterM parameterM) {
        return ResultUtil.okWithData(permissionMapper.findAll());
    }

    @Override
    public Result permission(ParameterM parameterM) {
        return ResultUtil.okWithData(permissionMapper.findById(parameterM.getId()));
    }

    @Override
    public Result userList(ParameterM parameterM) {
        return ResultUtil.okWithData(userMapper.findAll());
    }

    @Override
    public Result user(ParameterM parameterM) {
        return ResultUtil.okWithData(userMapper.findById(parameterM.getId()));
    }

    @Override
    public Result roleList(ParameterM parameterM) {
        if (parameterM.getIsuse() == 1) return ResultUtil.okWithData(roleMapper.findAllByIsuse());
        return ResultUtil.okWithData(roleMapper.findAll());
    }

    @Override
    public Result role(ParameterM parameterM) {
        return ResultUtil.okWithData(roleMapper.findById(parameterM.getId()));
    }

    @Override
    public Result userSud(ParameterM parameterM) {
        if (parameterM.getDelete() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            if (parameterM.getIds().split(",").length > 1) return ResultUtil.errorWithMessage("只能选择一条数据");
            if (parameterM.getIds().equals("85") || parameterM.getIds().equals("86") || parameterM.getIds().equals("90"))
                return ResultUtil.errorWithMessage("不能删除内置账号");
            userMapper.deleteById(Integer.parseInt(parameterM.getIds()));
            return ResultUtil.ok();
        }
        if (parameterM.getDelete() == 2) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                userMapper.deleteById(Integer.parseInt(id));
            }
            return ResultUtil.ok();
        }
        if (parameterM.getLock() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                userMapper.updateIsuse(Integer.parseInt(id), 1);
            }
            return ResultUtil.ok();
        }
        if (parameterM.getUse() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                userMapper.updateIsuse(Integer.parseInt(id), 0);
            }
            return ResultUtil.ok();
        }
        if (StringUtils.isBlank(parameterM.getUsername())) return ResultUtil.errorWithMessage("登录名不能为空！");
        if (StringUtils.isBlank(parameterM.getName())) return ResultUtil.errorWithMessage("姓名不能为空！");
        if (StringUtils.isBlank(parameterM.getWorkno())) return ResultUtil.errorWithMessage("工号不能为空！");
        if (StringUtils.isBlank(parameterM.getPassword())) return ResultUtil.errorWithMessage("密码不能为空！");
        if (StringUtils.isBlank(parameterM.getPassword2())) return ResultUtil.errorWithMessage("确认密码不能为空！");
        if (!parameterM.getPassword().equals(parameterM.getPassword2())) return ResultUtil.errorWithMessage("两次密码不一致！");
        if (parameterM.getUsername().equals(parameterM.getPassword())) return ResultUtil.errorWithMessage("用户名和密码不能重复！");
        if (parameterM.getPassword().length() < 8) return ResultUtil.errorWithMessage("密码长度最少8位！");
        String regex = "^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[_\\-@&=])[a-z0-9_\\-@&=]+$";
        if (!parameterM.getPassword().matches(regex)) return ResultUtil.errorWithMessage("密码至少数字、字母、特殊字符三种组合 ！");
        List<User> savedUserList = userMapper.findByUsername(parameterM.getUsername());
        if (savedUserList.size() > 0 && savedUserList.get(0).getId() != parameterM.getId()) return ResultUtil.errorWithMessage("登录名已经存在！");
        User user = null;
        if (parameterM.getId() != 0) user = userMapper.findById(parameterM.getId());
        else if (parameterM.getId() == 0) user = new User();
        user.setName(parameterM.getName());
        String newPassword = SM3Utils.encrypt(parameterM.getPassword());
        if (user != null && user.getPassword() != null && user.getPassword().equals(newPassword))
            return ResultUtil.errorWithMessage("新密码不能和旧密码重复！");
        user.setPassword(newPassword);
        user.setMobile(parameterM.getMobile());
        user.setWorkno(parameterM.getWorkno());
        user.setUsername(parameterM.getUsername());
        user.setTelephone(parameterM.getTelephone());
        user.setEmail(parameterM.getEmail());
        user.setIsuse(parameterM.getIsuse());
        user.setRemark(parameterM.getRemark());
        if (parameterM.getRoleid() != null && parameterM.getRoleid() != 0) {
            user.setRoleid(parameterM.getRoleid());
        }
        if (parameterM.getDeptid() != null && parameterM.getDeptid() != 0) {
            user.setDeptid(parameterM.getDeptid());
        }
        if (user.getId() != 0) {
            userMapper.updateUser(user);
            return ResultUtil.ok();
        } else {
            userMapper.insertUser(user);
        }
        userMapper.updatePwtime(user.getId(), TimeUtils.format(System.currentTimeMillis()));
        return ResultUtil.ok();
    }

    @Override
    public Result roleSud(ParameterM parameterM) {
        if (parameterM.getDelete() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            if (parameterM.getIds().split(",").length > 1) return ResultUtil.errorWithMessage("只能选择一条数据");
            Role role = roleMapper.findById(Integer.parseInt(parameterM.getIds()));
            if (role.getIslock() != null && role.getIslock() == 1) return ResultUtil.errorWithMessage("不能删除内置角色");
            List<User> userList = userMapper.findByRoleid(role.getId());
            if (userList != null && userList.size() > 0) return ResultUtil.errorWithMessage("有用户的角色不能删除");
            roleMapper.deleteById(Integer.parseInt(parameterM.getIds()));
            return ResultUtil.ok();
        } else if (parameterM.getDelete() == 2) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                Role role = roleMapper.findById(Integer.parseInt(id));
                if (role.getIslock() != null && role.getIslock() == 1) return ResultUtil.errorWithMessage("不能删除内置角色");
                List<User> userList = userMapper.findByRoleid(role.getId());
                if (userList != null && userList.size() > 0) return ResultUtil.errorWithMessage("有用户的角色不能删除");
                roleMapper.deleteById(Integer.parseInt(id));
            }
            return ResultUtil.ok();
        } else if (parameterM.getLock() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                roleMapper.updateIsuse(Integer.parseInt(id), 1);
            }
            return ResultUtil.ok();
        }
        if (!StringUtils.isNumeric(parameterM.getOrders())) return ResultUtil.errorWithMessage("排序只能是数字");
        if (StringUtils.isBlank(parameterM.getRname())) return ResultUtil.errorWithMessage("英文名称不能为空");
        if (!parameterM.getRname().matches("[a-zA-Z]")) return ResultUtil.errorWithMessage("英文名称只能是英文字母");
        Role role = null;
        if (parameterM.getId() != 0) role = roleMapper.findById(parameterM.getId());
        else if (parameterM.getId() == 0) role = new Role();
        role.setRname(parameterM.getRname());
        role.setIsuse(parameterM.getIsuse());
        role.setOrders(Integer.parseInt(parameterM.getOrders()));
        role.setRemark(parameterM.getRemark());
        role.setName(parameterM.getName());
        if (parameterM.getId() != 0) {
            roleMapper.updateRole(role);
            return ResultUtil.ok();
        } else {
            roleMapper.insertRole(role);
        }
        return ResultUtil.ok();
    }

    @Override
    public Result rolePermission(ParameterM parameterM) {
        int roleid = parameterM.getRoleid().intValue();
        if (roleMapper.findById(roleid).getIslock() == 1) return ResultUtil.errorWithMessage("内置角色不可以修改权限");
        String ids = parameterM.getPermissionids();
        role2PermissionMapper.deleteByRoleid(roleid);
        if (StringUtils.isBlank(ids)) return ResultUtil.ok();
        for (String id : ids.split(",")) {
            Role2Permission rp = new Role2Permission();
            rp.setRoleid(roleid);
            rp.setPermissionid(Integer.parseInt(id));
            role2PermissionMapper.insertRole2Permission(rp);
        }
        return ResultUtil.ok();
    }

    @Override
    public Result isInBlack(String ip) {
        if (blacklistMapper.findAllByBlack(ip).size() > 0) return ResultUtil.errorWithMessage("");
        else return ResultUtil.ok();
    }

    @Override
    public Result blacklist(int type) {
        return ResultUtil.okWithData(blacklistMapper.findAll(type));
    }

    @Override
    public Result blacklistSud(ParameterM parameterM) {
        Blacklist blacklist = blacklistMapper.findAllNotType(Integer.parseInt(parameterM.getType())).get(0);
        if (StringUtils.isNotBlank(parameterM.getIp())) {
            for (String ip : parameterM.getIp().split(";")) {
                if (blacklist.getIp() != null && blacklist.getIp().contains(ip))
                    return ResultUtil.errorWithMessage(ip + "不能同时存在黑名单和白名单中");
            }
        }
        blacklistMapper.update(parameterM.getIp(), Integer.parseInt(parameterM.getType()));
        return ResultUtil.okWithMessage("保存成功");
    }

    @Override
    public Result createLog(String method, String path, String ip) {
        List<Permission> permissionList = permissionMapper.findByUrl(path);
        if (permissionList != null && permissionList.size() == 1) {
            User me = (User) SecurityUtils.getSubject().getPrincipal();
            Logs logs = new Logs();
            logs.setMethod(method);
            logs.setName(permissionList.get(0).getName());
            logs.setUrl(path);
            logs.setIp(ip);
            logs.setUserusername(me.getUsername());
            logs.setUsername(me.getName());
            logs.setCreatetime(TimeUtils.format(System.currentTimeMillis()));
            logsMapper.insertLogs(logs);
        }
        return null;
    }

    @Override
    public Result logsList(ParameterM parameterM) {
        return ResultUtil.okWithData(logsMapper.findAll());
    }

}
