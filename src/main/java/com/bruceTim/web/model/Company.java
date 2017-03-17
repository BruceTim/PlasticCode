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
public class Company {

    @JSONField(serialize = false)
    private volatile static Company ourInstance = null;
    @JSONField(serialize = false)
    private static Object lock = new Object();

    private volatile String companyName;
    private volatile String detail;
    private volatile String businessType;
    private volatile String mainMarket;
    private volatile String brand;
    private volatile String employees;
    private volatile String established;
    private volatile String export;
    private volatile String introduction;
    private volatile String history;
    private volatile String service;
    private volatile String team;
    private volatile List<String> pictures;

    public static Company getInstance () {
        if (ourInstance == null) {
            synchronized (lock) {
                if (ourInstance == null) {
                    ourInstance = new Company();
                }
            }
        }
        return ourInstance;
    }

    private Company () {
    }

    public String getCompanyName () {
        return companyName;
    }

    public void setCompanyName (String companyName) {
        this.companyName = companyName;
    }

    public String getDetail () {
        return detail;
    }

    public void setDetail (String detail) {
        this.detail = detail;
    }

    public String getBusinessType () {
        return businessType;
    }

    public void setBusinessType (String businessType) {
        this.businessType = businessType;
    }

    public String getMainMarket () {
        return mainMarket;
    }

    public void setMainMarket (String mainMarket) {
        this.mainMarket = mainMarket;
    }

    public String getBrand () {
        return brand;
    }

    public void setBrand (String brand) {
        this.brand = brand;
    }

    public String getEmployees () {
        return employees;
    }

    public void setEmployees (String employees) {
        this.employees = employees;
    }

    public String getEstablished () {
        return established;
    }

    public void setEstablished (String established) {
        this.established = established;
    }

    public String getExport () {
        return export;
    }

    public void setExport (String export) {
        this.export = export;
    }

    public String getIntroduction () {
        return introduction;
    }

    public void setIntroduction (String introduction) {
        this.introduction = introduction;
    }

    public String getHistory () {
        return history;
    }

    public void setHistory (String history) {
        this.history = history;
    }

    public String getService () {
        return service;
    }

    public void setService (String service) {
        this.service = service;
    }

    public String getTeam () {
        return team;
    }

    public void setTeam (String team) {
        this.team = team;
    }

    public List<String> getPictures () {
        return pictures;
    }

    public void setPictures (List<String> pictures) {
        this.pictures = pictures;
    }

    public void addPictures (String pictures) {
        if("".equals(pictures)) return;
        if(pictures.indexOf("|") > 0) {
            this.pictures.addAll(Arrays.asList(pictures.split("\\|")));
        } else {
            this.pictures.add(pictures);
        }
    }

    public void setValue(String value){
        if("".equals(value.trim())) return;

        JSONObject json = JSON.parseObject(value);

        if(json.containsKey("companyName")){
            this.companyName = json.getString("companyName");
        }
        if(json.containsKey("detail")){
            this.detail = json.getString("detail");
        }
        if(json.containsKey("brand")){
            this.brand = json.getString("brand");
        }
        if(json.containsKey("mainMarket")){
            this.mainMarket = json.getString("mainMarket");
        }
        if(json.containsKey("businessType")){
            this.businessType = json.getString("businessType");
        }
        if(json.containsKey("employees")){
            this.employees = json.getString("employees");
        }
        if(json.containsKey("established")){
            this.established = json.getString("established");
        }
        if(json.containsKey("export")){
            this.export = json.getString("export");
        }
        if(json.containsKey("introduction")){
            this.introduction = json.getString("introduction");
        }
        if(json.containsKey("history")){
            this.history = json.getString("history");
        }
        if(json.containsKey("service")){
            this.service = json.getString("service");
        }
        if(json.containsKey("team")){
            this.team = json.getString("team");
        }
        if(json.containsKey("pictures")){
            JSONArray jsonArray = json.getJSONArray("pictures");
            this.pictures = JSONObject.parseArray(jsonArray.toJSONString(), String.class);
        }
    }

    public JSONObject toJSONObject () {
        JSONObject json = new JSONObject();
        json.put("companyName", companyName == null ? "" : companyName);
        json.put("detail", detail == null ? "" : detail);
        json.put("businessType", businessType == null ? "" : businessType);
        json.put("brand", brand == null ? "" : brand);
        json.put("mainMarket", mainMarket == null ? "" : mainMarket);
        json.put("employees", employees == null ? "" : employees);
        json.put("established", established == null ? "" : established);
        json.put("export", export == null ? "" : export);
        json.put("introduction", introduction == null ? "" : introduction);
        json.put("history", history == null ? "" : history);
        json.put("service", service == null ? "" : service);
        json.put("team", team == null ? "" : team);
        JSONArray jsonArray = new JSONArray();
        if(pictures != null && pictures.size() > 0) {
            jsonArray.addAll(pictures);
        } else {
            jsonArray.addAll(new ArrayList<String>());
        }

        json.put("pictures", jsonArray);

        return json;
    }
}
