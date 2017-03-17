package com.bruceTim.web.model;

import com.alibaba.fastjson.JSON;

public class Permission {
    private Long id;

    private String permissionName;

    private String permissionSign;

    private String description;

    private Boolean available;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName == null ? null : permissionName.trim();
    }

    public String getPermissionSign() {
        return permissionSign;
    }

    public void setPermissionSign(String permissionSign) {
        this.permissionSign = permissionSign == null ? null : permissionSign.trim();
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
        if (!(obj instanceof Permission)) return false;
        if (this.hashCode() == obj.hashCode()) return true;
        return this.permissionSign.equals(((Permission) obj).getPermissionSign());
    }

    @Override
    public String toString () {
        return JSON.toJSONString(this);
    }
}