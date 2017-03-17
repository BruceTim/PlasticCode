package com.bruceTim.web.service;

/**
 * Created by BruceTim on 2017/1/12.
 */
public interface PropertiesService {

    int updateByName(String name, String value);

    String selectByName(String name);
}
