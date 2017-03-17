package com.bruceTim.web.dao;

import com.bruceTim.core.generic.GenericDao;
import com.bruceTim.web.model.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper extends GenericDao<Product, Long>{

    int insert (Product record);

    long insertAndGetId (Product record);

    int deleteAdviceByPrimaryKey (Long id);

    int updateByPrimaryKey (Product record);

    int selectAmountByCategoryId (Long categoryId);

    List<Product> selectSelectiveByPage(Product product);

    List<Product> selectAdviceByCategoryId(Long categoryId);

    List<Product> selectByCategoryIdAndNameForPage(@Param("categoryId") Long categoryId, @Param("name") String name);

    List<Product> selectByTagForPage(String tag);

}