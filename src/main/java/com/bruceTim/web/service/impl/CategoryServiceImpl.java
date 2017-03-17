package com.bruceTim.web.service.impl;

import com.bruceTim.core.generic.GenericDao;
import com.bruceTim.core.generic.GenericServiceImpl;
import com.bruceTim.web.dao.CategoryMapper;
import com.bruceTim.web.model.Category;
import com.bruceTim.web.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by BruceTim on 2016/12/11.
 */
@Service
public class CategoryServiceImpl extends GenericServiceImpl<Category, Long> implements CategoryService {

    @Resource
    private CategoryMapper categoryMapper;

    @Override
    public GenericDao<Category, Long> getDao () {
        return categoryMapper;
    }

    @Override
    public List<Category> selectList () {
        return categoryMapper.selectAll();
    }

    @Override
    public boolean selectByName (String name) {
        Category category = new Category(name);
        return categoryMapper.selectSelective(category) == null;
    }
}
