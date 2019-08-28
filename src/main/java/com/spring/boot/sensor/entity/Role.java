package com.spring.boot.sensor.entity;

import java.util.List;
import java.util.Objects;

public class Role {
    private int id;
    private String name;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
