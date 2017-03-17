package com.bruceTim.web.service;

/**
 * Created by BruceTim on 2016/12/12.
 */
public interface AdviceService {

    int deleteByCategoryId (long categoryId);

    int insert(long categoryId, long[] productIds);
}
