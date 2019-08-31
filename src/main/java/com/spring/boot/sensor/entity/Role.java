package com.spring.boot.sensor.entity;

import java.util.List;
import java.util.Objects;

public class Role {
    private int id;
    private String cnname;
    private Integer isuse;
    private String name;
    private Integer order;
    private List<Role2Permission> role2Permissions;

    public List<Role2Permission> getRole2Permissions() {
        return role2Permissions;
    }

    public void setRole2Permissions(List<Role2Permission> role2Permissions) {
        this.role2Permissions = role2Permissions;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCnname() {
        return cnname;
    }

    public void setCnname(String cnname) {
        this.cnname = cnname;
    }

    public Integer getIsuse() {
        return isuse;
    }

    public void setIsuse(Integer isuse) {
        this.isuse = isuse;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }
}
