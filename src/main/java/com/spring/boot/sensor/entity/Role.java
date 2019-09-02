package com.spring.boot.sensor.entity;

import java.util.List;
import java.util.Objects;

public class Role {
    private int id;
    private String rname;
    private Integer isuse;
    private String name;
    private Integer orders;
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

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
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

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }
}
