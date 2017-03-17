package com.bruceTim.web.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bruceTim.core.generic.GenericEnum;

/**
 * 用户账号状态枚举类型
 * Created by BruceTim on 2016/11/18.
 */
public enum UserState implements GenericEnum {

    AVAILABLE("账号可用", 1), LOCKED("账号已锁定", -1), EXPIRED("账号已过期", -2),;

    private String state;
    private int index;

    UserState (String state, int index) {
        this.state = state;
        this.index = index;
    }

    @Override
    public int getValue () {
        return index;
    }

    @Override
    public String getText () {
        return state;
    }

    /**
     *  用于页面的下拉框等
     * @return
     */
    public static String valuesForJson(){
        JSONArray jsonArray = new JSONArray();
        for (UserState state: values()) {
            JSONObject json = new JSONObject();
            json.put("value", state.getValue());
            json.put("text", state.getText());
            jsonArray.add(json);
        }
        return jsonArray.toJSONString();
    }
}
