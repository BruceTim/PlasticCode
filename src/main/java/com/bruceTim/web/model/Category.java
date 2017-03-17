package com.bruceTim.web.model;

public class Category {
    private Long id;

    private String categoryName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Category () {
    }

    public Category (Long id) {
        this.id = id;
    }

    public Category (Long id, String categoryName) {
        this.id = id;
        this.categoryName = categoryName;
    }

    public Category (String categoryName) {
        this.categoryName = categoryName;
    }
}