package com.bruceTim.web.service;

import com.bruceTim.core.generic.GenericService;
import com.bruceTim.web.model.Category;

/**
 * Created by BruceTim on 2016/12/11.
 */
public interface CategoryService extends GenericService<Category, Long> {

    boolean selectByName(String name);
}
