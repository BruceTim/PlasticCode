package com.bruceTim.web.dao;

import org.apache.ibatis.annotations.Param;

public interface AdviceMapper {

    int deleteByCategoryId (long categoryId);

    int insert (@Param("categoryId") long categoryId, @Param("productIds") long[] productIds);
}