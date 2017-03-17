package com.bruceTim.web.model;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by BruceTim on 2017/1/8.
 */
public class FactoryTour {

    private static FactoryTour ourInstance = null;
    @JSONField(serialize = false)
    private static Object lock = new Object();

    private volatile List<String> pictures1;
    private volatile List<String> pictures2;
    private volatile List<String> pictures3;
    private volatile List<String> pictures4;

    @JSONField(serialize = false)
    public static FactoryTour getInstance () {
        if (ourInstance == null) {
            synchronized (lock) {
                if (ourInstance == null) {
                    ourInstance = new FactoryTour();
                }
            }
        }
        return ourInstance;
    }

    private FactoryTour () {
    }

    public List<String> getPictures1 () {
        return pictures1;
    }

    public void setPictures1 (List<String> pictures1) {
        this.pictures1 = pictures1;
    }

    public List<String> getPictures2 () {
        return pictures2;
    }

    public void setPictures2 (List<String> pictures2) {
        this.pictures2 = pictures2;
    }

    public List<String> getPictures3 () {
        return pictures3;
    }

    public void setPictures3 (List<String> pictures3) {
        this.pictures3 = pictures3;
    }

    public List<String> getPictures4 () {
        return pictures4;
    }

    public void setPictures4 (List<String> pictures4) {
        this.pictures4 = pictures4;
    }

    public void addPictures1(String pictures1){
        if("".equals(pictures1)) return;
        if(pictures1.indexOf("|") > 0) {
            this.pictures1.addAll(Arrays.asList(pictures1.split("\\|")));
        } else {
            this.pictures1.add(pictures1);
        }
    }

    public void addPictures4(String pictures4){
        if("".equals(pictures4)) return;
        if(pictures4.indexOf("|") > 0) {
            this.pictures4.addAll(Arrays.asList(pictures4.split("\\|")));
        } else {
            this.pictures4.add(pictures4);
        }
    }

    public void addPictures2(String pictures2){
        if("".equals(pictures2)) return;
        if(pictures2.indexOf("|") > 0) {
            this.pictures2.addAll(Arrays.asList(pictures2.split("\\|")));
        } else {
            this.pictures2.add(pictures2);
        }
    }

    public void addPictures3(String pictures3){
        if("".equals(pictures3)) return;
        if(pictures3.indexOf("|") > 0) {
            this.pictures3.addAll(Arrays.asList(pictures3.split("\\|")));
        } else {
            this.pictures3.add(pictures3);
        }
    }

    public void setValue(String value){
        if("".equals(value.trim())) return;

        JSONObject json = JSON.parseObject(value);
        if(json.containsKey("pictures1")){
            JSONArray jsonArray = json.getJSONArray("pictures1");
            this.pictures1 = JSONObject.parseArray(jsonArray.toJSONString(), String.class);
        }
        if(json.containsKey("pictures2")){
            JSONArray jsonArray = json.getJSONArray("pictures2");
            this.pictures2 = JSONObject.parseArray(jsonArray.toJSONString(), String.class);
        }
        if(json.containsKey("pictures3")){
            JSONArray jsonArray = json.getJSONArray("pictures3");
            this.pictures3 = JSONObject.parseArray(jsonArray.toJSONString(), String.class);
        }
        if(json.containsKey("pictures4")){
            JSONArray jsonArray = json.getJSONArray("pictures4");
            this.pictures4 = JSONObject.parseArray(jsonArray.toJSONString(), String.class);
        }
    }

    public JSONObject toJSONObject () {

        JSONObject json = new JSONObject();
        JSONArray jsonArray1 = new JSONArray();
        if(pictures1 != null && pictures1.size() > 0) {
            jsonArray1.addAll(pictures1);
        } else {
            jsonArray1.addAll(new ArrayList<String>());
        }
        json.put("pictures1", jsonArray1);

        JSONArray jsonArray2 = new JSONArray();
        if(pictures2 != null && pictures2.size() > 0) {
            jsonArray2.addAll(pictures2);
        } else {
            jsonArray2.addAll(new ArrayList<String>());
        }
        json.put("pictures2", jsonArray2);

        JSONArray jsonArray3 = new JSONArray();
        if(pictures3 != null && pictures3.size() > 0) {
            jsonArray3.addAll(pictures3);
        } else {
            jsonArray3.addAll(new ArrayList<String>());
        }
        json.put("pictures3", jsonArray3);

        JSONArray jsonArray4 = new JSONArray();
        if(pictures4 != null && pictures4.size() > 0) {
            jsonArray4.addAll(pictures4);
        } else {
            jsonArray4.addAll(new ArrayList<String>());
        }
        json.put("pictures4", jsonArray4);
        return json;
    }
}
