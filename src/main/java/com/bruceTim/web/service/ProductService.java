package com.bruceTim.web.service;

import com.bruceTim.core.generic.GenericService;
import com.bruceTim.web.model.Product;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by BruceTim on 2016/12/11.
 */
public interface ProductService extends GenericService<Product, Long>{

    long insertAndGetId(Product product);

    int selectAmountByCategoryId(Long categoryId);

    PageInfo<Product> selectListByCategoryId(Long categoryId, int pageNo, int pageSize);

    List<Product> selectAdviceListByCategoryId(Long categoryId);

    PageInfo<Product> selectListByCategoryIdAndName(Long categoryId, String name, int pageNo, int pageSize);

    PageInfo<Product> selectListByTag(String tag, int pageNo, int pageSize);
 }
