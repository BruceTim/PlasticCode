package com.bruceTim.web.model;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by BruceTim on 2017/1/8.
 */
public class QualityControl {

    private static QualityControl ourInstance = null;
    private static Object lock = new Object();

    private volatile String standard;
    private volatile String number;
    private volatile String issueDate;
    private volatile String expiryDate;
    private volatile String picture;
    private volatile String content;

    public static QualityControl getInstance () {
        if (ourInstance == null) {
            synchronized (lock) {
                if (ourInstance == null) {
                    ourInstance = new QualityControl();
                }
            }
        }
        return ourInstance;
    }

    private QualityControl () {
    }

    public String getStandard () {
        return standard;
    }

    public void setStandard (String standard) {
        this.standard = standard;
    }

    public String getNumber () {
        return number;
    }

    public void setNumber (String number) {
        this.number = number;
    }

    public String getIssueDate () {
        return issueDate;
    }

    public void setIssueDate (String issueDate) {
        this.issueDate = issueDate;
    }

    public String getExpiryDate () {
        return expiryDate;
    }

    public void setExpiryDate (String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getPicture () {
        return picture;
    }

    public void setPicture (String picture) {
        this.picture = picture;
    }

    public String getContent () {
        return content;
    }

    public void setContent (String content) {
        this.content = content;
    }

    public void setValue(String value){
        if("".equals(value.trim())) return;

        JSONObject json = JSON.parseObject(value);
        if(json.containsKey("picture")){
            this.picture = json.getString("picture");
        }
        if(json.containsKey("standard")){
            this.standard = json.getString("standard");
        }
        if(json.containsKey("number")){
            this.number = json.getString("number");
        }
        if(json.containsKey("issueDate")){
            this.issueDate = json.getString("issueDate");
        }
        if(json.containsKey("expiryDate")){
            this.expiryDate = json.getString("expiryDate");
        }
    }

    public JSONObject toJSONObject () {

        JSONObject json = new JSONObject();
        json.put("picture", picture == null ? "" : picture);
        json.put("standard", standard == null ? "" : standard);
        json.put("number", number == null ? "" : number);
        json.put("issueDate", issueDate == null ? "" : issueDate);
        json.put("expiryDate", expiryDate == null ? "" : expiryDate);
        json.put("content", content == null ? "" : content);
        return json;
    }
}
