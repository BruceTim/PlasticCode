package com.bruceTim.web.model;

import com.alibaba.fastjson.JSON;

import java.util.Set;

public class Role {
    private Long id;

    private String roleName;

    private String roleSign;

    private String description;

    private Boolean available;

    private Set<Permission> permissions;

    public Set<Permission> getPermissions () {
        return permissions;
    }

    public void setPermissions (Set<Permission> permissions) {
        this.permissions = permissions;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleSign() {
        return roleSign;
    }

    public void setRoleSign(String roleSign) {
        this.roleSign = roleSign == null ? null : roleSign.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    @Override
    public int hashCode () {
        return id.hashCode();
    }

    @Override
    public boolean equals (Object obj) {
        if (obj == null) return false;
        if (!(obj instanceof Role)) return false;
        if (this.hashCode() == obj.hashCode()) return true;
        return this.roleSign.equals(((Role) obj).getRoleSign());
    }

    @Override
    public String toString () {
        return JSON.toJSONString(this);
    }
}