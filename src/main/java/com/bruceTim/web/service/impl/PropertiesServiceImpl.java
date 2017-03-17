package com.bruceTim.web.service.impl;

import com.bruceTim.web.dao.PropertiesMapper;
import com.bruceTim.web.service.PropertiesService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by BruceTim on 2017/1/12.
 */
@Service
public class PropertiesServiceImpl implements PropertiesService {

    @Resource
    private PropertiesMapper propertiesMapper;

    @Transactional
    @Override
    public int updateByName (String name, String value) {
        return propertiesMapper.updateByName(name, value);
    }

    @Override
    public String selectByName (String name) {
        return propertiesMapper.selectByName(name);
    }
}
