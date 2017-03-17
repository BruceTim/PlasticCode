package com.bruceTim.web.service.impl;

import com.bruceTim.core.generic.GenericDao;
import com.bruceTim.core.generic.GenericServiceImpl;
import com.bruceTim.web.dao.ProductMapper;
import com.bruceTim.web.model.Category;
import com.bruceTim.web.model.Product;
import com.bruceTim.web.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by BruceTim on 2016/12/11.
 */
@Service
public class ProductServiceImpl extends GenericServiceImpl<Product, Long> implements ProductService {


    @Resource
    private ProductMapper productMapper;

    @Override
    public GenericDao<Product, Long> getDao () {
        return this.productMapper;
    }

    @Override
    public long insertAndGetId(Product product){
    	long rs = productMapper.insertAndGetId(product);
    	if(rs > 0) return product.getId();
        return rs;
    }

    @Override
    public int selectAmountByCategoryId (Long categoryId) {
        return productMapper.selectAmountByCategoryId(categoryId);
    }

    @Override
    public PageInfo<Product> selectListByCategoryId (Long categoryId, int pageNo, int pageSize) {

        PageHelper.startPage(pageNo, pageSize);
        PageHelper.orderBy("id");
        Product product = new Product();
        product.setCategory(new Category(categoryId));
        PageInfo<Product> page = new PageInfo<>(productMapper.selectSelectiveByPage(product));
        return page;
    }

    @Override
    public List<Product> selectAdviceListByCategoryId (Long categoryId) {
        return productMapper.selectAdviceByCategoryId(categoryId);
    }

    @Override
    public PageInfo<Product> selectListByCategoryIdAndName (Long categoryId, String name, int pageNo, int pageSize) {

        PageHelper.startPage(pageNo, pageSize);
        PageHelper.orderBy("id");
        List<Product> list =  productMapper.selectByCategoryIdAndNameForPage(categoryId, name);
        PageInfo<Product> page = new PageInfo<>(list);
        return page;
    }

    @Override
    @Transactional
    public int delete (Long id) {
        return productMapper.deleteAdviceByPrimaryKey(id) + productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public PageInfo<Product> selectListByTag (String tag, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        PageHelper.orderBy("id");
        List<Product> list =  productMapper.selectByTagForPage(tag);
        PageInfo<Product> page = new PageInfo<>(list);
        return page;
    }
}
