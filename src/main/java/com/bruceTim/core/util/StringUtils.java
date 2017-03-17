package com.bruceTim.core.util;

import com.alibaba.fastjson.JSON;

/**
 * Created by BruceTim on 2016/11/16.
 */
public class StringUtils {

    public static String obj2Json(Object obj){
        return JSON.toJSONString(obj);
    }
}
