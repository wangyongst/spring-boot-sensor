package com.spring.boot.sensor.entity;

import java.util.List;
import java.util.Objects;

public class User {
    private int id;
    private String username;
    private String name;
    private String finger;
    private String password;
    private String workno;
    private String mobile;
    private String telephone;
    private String email;
    private String remark;
    private Integer islock;
    private Integer deptid;
    private List<User2Role> user2Roles;

    public List<User2Role> getUser2Roles() {
        return user2Roles;
    }

    public void setUser2Roles(List<User2Role> user2Roles) {
        this.user2Roles = user2Roles;
    }

    public String getFinger() {
        return finger;
    }

    public void setFinger(String finger) {
        this.finger = finger;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getWorkno() {
        return workno;
    }

    public void setWorkno(String workno) {
        this.workno = workno;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getIslock() {
        return islock;
    }

    public void setIslock(Integer islock) {
        this.islock = islock;
    }
}
