package com.bruceTim.web.dao;

import com.bruceTim.core.generic.GenericDao;
import com.bruceTim.web.model.Category;

import java.util.List;

public interface CategoryMapper extends GenericDao<Category, Long> {

    Category selectSelective (Category record);

    int insert (Category record);

    int updateByPrimaryKey (Category record);

    List<Category> selectAll ();
}