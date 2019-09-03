package com.spring.boot.sensor.service.impl;

import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.entity.Role2Permission;
import com.spring.boot.sensor.entity.User;
import com.spring.boot.sensor.mapper.*;
import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.service.AdminService;
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

;import java.util.List;


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
    private BlacklistMapper blacklistMapper;

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
            deptMapper.deleteById(Integer.parseInt(parameterM.getIds()));
            return ResultUtil.ok();
        } else if (parameterM.getDelete() == 2) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                deptMapper.deleteById(Integer.parseInt(id));
            }
            return ResultUtil.ok();
        } else if (parameterM.getIsuse() == 1) {
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
        dept.setpId(parameterM.getpId());
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
        if (!StringUtils.isNumeric(parameterM.getOrders())) return ResultUtil.errorWithMessage("排序只能是数字");
        if (StringUtils.isBlank(parameterM.getCode())) return ResultUtil.errorWithMessage("组织编码不能为空");
        if (StringUtils.isBlank(parameterM.getName())) return ResultUtil.errorWithMessage("组织名称不能为空");
        if (parameterM.getDelete() == 1) {
            deptMapper.deleteById(parameterM.getId());
            return ResultUtil.ok();
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
            userMapper.deleteById(Integer.parseInt(parameterM.getIds()));
            return ResultUtil.ok();
        } else if (parameterM.getDelete() == 2) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                userMapper.deleteById(Integer.parseInt(id));
            }
            return ResultUtil.ok();
        } else if (parameterM.getIsuse() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                deptMapper.updateIsuse(Integer.parseInt(id), 1);
            }
            return ResultUtil.ok();
        }

        User user = null;
        if (StringUtils.isBlank(parameterM.getUsername())) return ResultUtil.errorWithMessage("电话不能为空！");
        if (StringUtils.isBlank(parameterM.getName())) return ResultUtil.errorWithMessage("姓名不能为空！");
        if (StringUtils.isBlank(parameterM.getWorkno())) return ResultUtil.errorWithMessage("电话不能为空！");
        if (StringUtils.isBlank(parameterM.getPassword())) return ResultUtil.errorWithMessage("姓名不能为空！");
        user.setName(parameterM.getName());
        user.setPassword(new Md5Hash(parameterM.getPassword()).toHex());
        user.setMobile(parameterM.getMobile());
        return ResultUtil.ok();
    }

    @Override
    public Result roleSud(ParameterM parameterM) {
        if (parameterM.getDelete() == 1) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            if (parameterM.getIds().split(",").length > 1) return ResultUtil.errorWithMessage("只能选择一条数据");
            roleMapper.deleteById(Integer.parseInt(parameterM.getIds()));
            return ResultUtil.ok();
        } else if (parameterM.getDelete() == 2) {
            if (StringUtils.isBlank(parameterM.getIds())) return ResultUtil.errorWithMessage("请先选择要操作的数据");
            for (String id : parameterM.getIds().split(",")) {
                roleMapper.deleteById(Integer.parseInt(id));
            }
            return ResultUtil.ok();
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
        blacklistMapper.update(parameterM.getIp(),Integer.parseInt(parameterM.getType()));
        return ResultUtil.okWithMessage("保存成功");
    }

}
