package com.bruceTim.web.model;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Created by BruceTim on 2017/1/8.
 */
public class ContactUs {

    private static ContactUs ourInstance = null;
    private static Object lock = new Object();

    private volatile String address;
    private volatile String fAddress;
    private volatile String workTime;
    private volatile String tellPhone;
    private volatile String fax;
    private volatile String contactPerson;
    private volatile String jobTitle;
    private volatile String phone;
    private volatile String email;

    private volatile String transferName;
    private volatile String transferPwd;

    public static ContactUs getInstance () {
        if (ourInstance == null) {
            synchronized (lock) {
                if (ourInstance == null) {
                    ourInstance = new ContactUs();
                }
            }
        }
        return ourInstance;
    }

    private ContactUs () {
    }

    public String getAddress () {
        return address;
    }

    public void setAddress (String address) {
        this.address = address;
    }

    public String getfAddress () {
        return fAddress;
    }

    public void setfAddress (String fAddress) {
        this.fAddress = fAddress;
    }

    public String getWorkTime () {
        return workTime;
    }

    public void setWorkTime (String workTime) {
        this.workTime = workTime;
    }

    public String getTellPhone () {
        return tellPhone;
    }

    public void setTellPhone (String tellPhone) {
        this.tellPhone = tellPhone;
    }

    public String getFax () {
        return fax;
    }

    public void setFax (String fax) {
        this.fax = fax;
    }

    public String getContactPerson () {
        return contactPerson;
    }

    public void setContactPerson (String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getJobTitle () {
        return jobTitle;
    }

    public void setJobTitle (String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getPhone () {
        return phone;
    }

    public void setPhone (String phone) {
        this.phone = phone;
    }

    public String getEmail () {
        return email;
    }

    public void setEmail (String email) {
        this.email = email;
    }

    public String getTransferName () {
        return transferName;
    }

    public void setTransferName (String transferName) {
        this.transferName = transferName;
    }

    public String getTransferPwd () {
        return transferPwd;
    }

    public void setTransferPwd (String transferPwd) {
        this.transferPwd = transferPwd;
    }

    public void setValue(String value){
        if("".equals(value.trim())) return;

        JSONObject json = JSON.parseObject(value);
        if(json.containsKey("address")){
            this.address = json.getString("address");
        }
        if(json.containsKey("fAddress")){
            this.fAddress = json.getString("fAddress");
        }
        if(json.containsKey("workTime")){
            this.workTime = json.getString("workTime");
        }
        if(json.containsKey("tellPhone")){
            this.tellPhone = json.getString("tellPhone");
        }
        if(json.containsKey("fax")){
            this.fax = json.getString("fax");
        }
        if(json.containsKey("contactPerson")){
            this.contactPerson = json.getString("contactPerson");
        }
        if(json.containsKey("jobTitle")){
            this.jobTitle = json.getString("jobTitle");
        }
        if(json.containsKey("phone")){
            this.phone = json.getString("phone");
        }
        if(json.containsKey("email")){
            this.email = json.getString("email");
        }
    }

    public JSONObject toJSONObject () {

        JSONObject json = new JSONObject();
        json.put("address", address == null ? "" : address);
        json.put("fAddress", fAddress == null ? "" : fAddress);
        json.put("workTime", workTime == null ? "" : workTime);
        json.put("tellPhone", tellPhone == null ? "" : tellPhone);
        json.put("fax", fax == null ? "" : fax);
        json.put("contactPerson", contactPerson == null ? "" : contactPerson);
        json.put("jobTitle", jobTitle == null ? "" : jobTitle);
        json.put("phone", phone == null ? "" : phone);
        json.put("email", email == null ? "" : email);
        return json;
    }

}
