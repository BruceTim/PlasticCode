package com.bruceTim.web.model;

import com.alibaba.fastjson.annotation.JSONField;
import com.bruceTim.web.enums.EmailState;

import java.util.Date;

public class Email {
    private Long id;

    private String sender;

    private String subject;

    private String transfer;

    private String receiver;

    private Date createTime;

    private String senderName;

    private String senderCompany;

    private String senderPhone;

    private String senderFax;

    private String website;

    private String senderCountry;

    private String priceTerms;

    private String payment;

    private String initialOrder;

    private String sampleTerms;

    private Boolean specification;

    private Boolean companyDescription;

    private Boolean deliverTime;

    private String file1;

    private String file2;

    private String file3;

    private boolean urgent;

    private boolean subscribed;

    private EmailState state;

    private String other;

    private String content;

    public Email (Long id) {
        this.id = id;
    }

    public Email () {
        state = EmailState.UNREAD;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender == null ? null : sender.trim();
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    public String getTransfer() {
        return transfer;
    }

    public void setTransfer(String transfer) {
        this.transfer = transfer == null ? null : transfer.trim();
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName == null ? null : senderName.trim();
    }

    public String getSenderCompany() {
        return senderCompany;
    }

    public void setSenderCompany(String senderCompany) {
        this.senderCompany = senderCompany == null ? null : senderCompany.trim();
    }

    public String getSenderPhone() {
        return senderPhone;
    }

    public void setSenderPhone(String senderPhone) {
        this.senderPhone = senderPhone == null ? null : senderPhone.trim();
    }

    public String getSenderFax() {
        return senderFax;
    }

    public void setSenderFax(String senderFax) {
        this.senderFax = senderFax == null ? null : senderFax.trim();
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website == null ? null : website.trim();
    }

    public String getSenderCountry() {
        return senderCountry;
    }

    public void setSenderCountry(String senderCountry) {
        this.senderCountry = senderCountry == null ? null : senderCountry.trim();
    }

    public String getPriceTerms() {
        return priceTerms;
    }

    public void setPriceTerms(String priceTerms) {
        this.priceTerms = priceTerms == null ? null : priceTerms.trim();
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment == null ? null : payment.trim();
    }

    public String getInitialOrder() {
        return initialOrder;
    }

    public void setInitialOrder(String initialOrder) {
        this.initialOrder = initialOrder == null ? null : initialOrder.trim();
    }

    public String getSampleTerms() {
        return sampleTerms;
    }

    public void setSampleTerms(String sampleTerms) {
        this.sampleTerms = sampleTerms == null ? null : sampleTerms.trim();
    }

    public Boolean getSpecification() {
        return specification;
    }

    public void setSpecification(Boolean specification) {
        this.specification = specification;
    }

    public Boolean getCompanyDescription() {
        return companyDescription;
    }

    public void setCompanyDescription(Boolean companyDescription) {
        this.companyDescription = companyDescription;
    }

    public Boolean getDeliverTime() {
        return deliverTime;
    }

    public void setDeliverTime(Boolean deliverTime) {
        this.deliverTime = deliverTime;
    }

    public String getFile1() {
        return file1;
    }

    public void setFile1(String file1) {
        this.file1 = file1 == null ? null : file1.trim();
    }

    public String getFile2() {
        return file2;
    }

    public void setFile2(String file2) {
        this.file2 = file2 == null ? null : file2.trim();
    }

    public String getFile3() {
        return file3;
    }

    public void setFile3(String file3) {
        this.file3 = file3 == null ? null : file3.trim();
    }

    public boolean getUrgent() {
        return urgent;
    }

    public void setUrgent(boolean urgent) {
        this.urgent = urgent;
    }

    public boolean getSubscribed() {
        return subscribed;
    }

    public void setSubscribed(boolean subscribed) {
        this.subscribed = subscribed;
    }

    @JSONField(serialize = false)
    public EmailState getState() {
        return state;
    }

    @JSONField(name = "stateValue")
    public int getStateValue(){return state.getValue(); }

    @JSONField(name = "stateText")
    public String getStateText(){return state.getText(); }

    public void setState(EmailState state) {
        this.state = state;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other == null ? null : other.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String toHtml(){
        return "";
    }
}