package com.spring.boot.sensor.service.impl;

import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.entity.Role2Permission;
import com.spring.boot.sensor.entity.User;
import com.spring.boot.sensor.model.ParameterM;
import com.spring.boot.sensor.repository.PermissionRepository;
import com.spring.boot.sensor.repository.Role2PermissionRepository;
import com.spring.boot.sensor.repository.RoleRepository;
import com.spring.boot.sensor.repository.UserRepository;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

;


@Service
@SuppressWarnings("All")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class, readOnly = false)
public class AdminServiceImpl implements AdminService {

    private static final Logger logger = LogManager.getLogger(AdminServiceImpl.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PermissionRepository permissionRepository;

    @Autowired
    private Role2PermissionRepository role2PermissionRepository;

    @Override
    public Result me() {
        User me = (User) SecurityUtils.getSubject().getPrincipal();
        return ResultUtil.okWithData(userRepository.findById(me.getId()).get());
    }

    @Override
    public Result findByUsername(String username) {
        List<User> userList = userRepository.findByMobile(username);
        if (userList.size() == 1) return ResultUtil.okWithData(userList.get(0));
        return null;
    }

    @Override
    public Result userList(ParameterM parameterM) {
        Sort sort = new Sort(Sort.Direction.DESC, "createtime");
        User user = new User();
        if (StringUtils.isNotBlank(parameterM.getMobile())) user.setMobile(parameterM.getMobile());
        if (StringUtils.isNotBlank(parameterM.getName())) user.setName(parameterM.getName());
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("mobile", match -> match.contains())
                .withMatcher("name", match -> match.contains());
        Example<User> example = Example.of(user, matcher);
        return ResultUtil.okWithData(userRepository.findAll(example, sort));
    }

    @Override
    public Result roleList(ParameterM parameterM) {
        List<Role> roles = roleRepository.findAll();
        Role role = roleRepository.findById(13).get();
        roles.remove(role);
        return ResultUtil.okWithData(roles);
    }

    @Override
    public Result user(ParameterM parameterM) {
        return ResultUtil.okWithData(userRepository.findById(parameterM.getUserid()).get());
    }

    @Override
    public Result userSud(ParameterM parameterM) {
        User user = null;
        if (parameterM.getUserid() == 0) {
            if (StringUtils.isBlank(parameterM.getMobile())) return ResultUtil.errorWithMessage("电话不能为空！");
            if (userRepository.findByMobile(parameterM.getMobile()).size() > 0)
                return ResultUtil.errorWithMessage("电话已经存在！");
            user = new User();
            user.setCreatetime(TimeUtils.format(System.currentTimeMillis()));
            user.setIschange(0);
            User me = (User) SecurityUtils.getSubject().getPrincipal();
            user.setCreateusername(me.getName());
        } else {
            user = userRepository.findById(parameterM.getUserid()).get();
            if (parameterM.getDelete() != 0) {
                if (user.getId() == ((User) SecurityUtils.getSubject().getPrincipal()).getId())
                    SecurityUtils.getSubject().logout();
                deleteUser(user);
                return ResultUtil.ok();
            }
        }
        if (StringUtils.isBlank(parameterM.getMobile())) return ResultUtil.errorWithMessage("电话不能为空！");
        if (StringUtils.isBlank(parameterM.getName())) return ResultUtil.errorWithMessage("登录姓名不能为空！");
        if (parameterM.getName().length() > 10) return ResultUtil.errorWithMessage("登录姓名不能超过10个字！");
        String regex = "^[0-9]+$";
        if (!parameterM.getMobile().matches(regex)) return ResultUtil.errorWithMessage("电话只能是数字！");
        if (parameterM.getMobile().length() != 11) return ResultUtil.errorWithMessage("电话只能是11位数字！");
        if (StringUtils.isBlank(parameterM.getPassword())) return ResultUtil.errorWithMessage("密码不能为空！");
        regex = "^[a-z0-9A-Z]+$";
        if (!parameterM.getPassword().matches(regex)) return ResultUtil.errorWithMessage("密码只支持数字和英文！");
        if (parameterM.getRoleid() == 0) return ResultUtil.errorWithMessage("配置角色未选择！");
        user.setName(parameterM.getName());
        user.setPassword(new Md5Hash(parameterM.getPassword()).toHex());
        user.setMobile(parameterM.getMobile());
        userRepository.save(user);
        return ResultUtil.ok();
    }

    @Override
    public Result role(ParameterM parameterM) {
        return ResultUtil.okWithData(roleRepository.findById(parameterM.getRoleid()).get());
    }

    @Override
    public Result roleSud(ParameterM parameterM) {
        Role role = null;
        if (parameterM.getRoleid() == 0) {
            role = new Role();
        } else {
            role = roleRepository.findById(parameterM.getRoleid()).get();
            if (parameterM.getDelete() != 0) {
                deleteRole(role);
                return ResultUtil.ok();
            }
        }
        if (StringUtils.isBlank(parameterM.getName())) return ResultUtil.errorWithMessage("角色名称不能为空！");
        if (parameterM.getName().length() > 10) return ResultUtil.errorWithMessage("角色名称最多10个字！");
        role.setName(parameterM.getName());
        Role saveedRole = roleRepository.save(role);
        role2PermissionRepository.deleteAllByRole(role);
        if (parameterM.getPermission() != null && parameterM.getPermission().size() > 0) {
            parameterM.getPermission().forEach(e -> {
                Role2Permission role2Permission = new Role2Permission();
                role2Permission.setRole(saveedRole);
                role2Permission.setPermission(permissionRepository.findById(e).get());
                role2PermissionRepository.save(role2Permission);
            });
        }
        return ResultUtil.ok();
    }

    @Override
    public Result permissionList(ParameterM parameterM) {
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        return ResultUtil.okWithData(permissionRepository.findAll(sort));
    }

    @Override
    public Result changePassword(ParameterM parameterM) {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        if (StringUtils.isBlank(parameterM.getPassword())) return ResultUtil.errorWithMessage("原录密码不能为空！");
        if (StringUtils.isBlank(parameterM.getNewpassword())) return ResultUtil.errorWithMessage("新密码不能为空不能为空！");
        if (!parameterM.getNewpassword().equals(parameterM.getNewpassword2()))
            return ResultUtil.errorWithMessage("两次密码输入不一致，请重新输入！");
        if (parameterM.getPassword().equals(parameterM.getNewpassword()))
            return ResultUtil.errorWithMessage("新密码与原密码相同，请重新输入！");
        if (parameterM.getNewpassword().length() < 3 || parameterM.getNewpassword().length() > 20)
            return ResultUtil.errorWithMessage("密码长度不正确，请重新输入（最短3个字符，最长20个字符）（！");
        String regex = "^[a-z0-9A-Z]+$";
        if (!parameterM.getNewpassword().matches(regex)) return ResultUtil.errorWithMessage("密码只包含数字和英文,其他字符不能输入！");
        if (userRepository.findById(user.getId()).get().getPassword().equals(new Md5Hash(parameterM.getPassword()).toHex())) {
            user.setPassword(new Md5Hash(parameterM.getNewpassword()).toHex());
            user.setIschange(1);
            userRepository.save(user);
            return ResultUtil.ok();
        } else {
            return ResultUtil.errorWithMessage("原密码错误！");
        }
    }

    @Override
    public void deleteRole(Role role) {
        userRepository.findByRole(role).forEach(e -> {
            e.setRole(null);
            userRepository.save(e);
        });
        role2PermissionRepository.deleteAllByRole(role);
        roleRepository.delete(role);
    }

    public void deleteUser(User user) {
        userRepository.delete(user);
    }
}
