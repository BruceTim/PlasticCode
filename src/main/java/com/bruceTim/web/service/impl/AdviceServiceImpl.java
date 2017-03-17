package com.bruceTim.web.service.impl;

import com.bruceTim.web.dao.AdviceMapper;
import com.bruceTim.web.service.AdviceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by BruceTim on 2016/12/12.
 */
@Service
public class AdviceServiceImpl implements AdviceService {

    @Resource
    private AdviceMapper adviceMapper;

    @Override
    @Transactional
    public int deleteByCategoryId (long categoryId) {
        return adviceMapper.deleteByCategoryId(categoryId);
    }

    @Override
    @Transactional
    public int insert (long categoryId, long[] productIds) {
        int result = adviceMapper.deleteByCategoryId(categoryId);
        result = result + adviceMapper.insert(categoryId, productIds);
        return result;
    }
}
