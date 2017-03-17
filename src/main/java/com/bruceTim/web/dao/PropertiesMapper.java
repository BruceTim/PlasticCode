package com.bruceTim.web.dao;

import org.apache.ibatis.annotations.Param;

public interface PropertiesMapper {

    String selectByName (@Param("name") String name);

    int updateByName (@Param("name") String name, @Param("value") String value);

}