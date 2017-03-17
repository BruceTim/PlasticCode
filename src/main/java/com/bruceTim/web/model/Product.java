package com.bruceTim.web.model;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.util.*;

public class Product {
    private Long id;

    private Category category;

    private String tag1;

    private String tag2;

    private String tag3;

    private String brandName;

    private String modelNumber;

    private String certification;

    private String placeOfOrigin;

    private String minOrderQty;

    private String price;

    private String paymentTerms;

    private String supplyAbility;

    private String deliveryTime;

    private String packagingDetails;

    private String productName;

    private Date createTime;

    private String customProperties;

    private String content;

    private String description;

    private String pictures;

    private List<String> pictureSet;

    public String getCustomProperties() {
        return customProperties;
    }

    public void setCustomProperties(String customProperties) {
        this.customProperties = customProperties == null ? null : customProperties.trim();
    }

    @JSONField(serialize = false)
    public String getContent() {
        return content;
    }

    /**
     *  输出content 的前150个字符
     * @return
     */
    @JSONField(name="content")
    public String getContent1() {
        if (content != null && content.length() >=150) {
            String str = content.substring(0, 150);
            str = str.substring(0, str.lastIndexOf(" "));
            content = str + "...";
        }
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    @JSONField(serialize = false)
    public String getPictures() {
        return pictures;
    }

    public void setPictures(String pictures) {
        this.pictures = pictures == null ? null : pictures;
        if (!"".equals(pictures)) {
            setPictureSet(Arrays.asList(pictures.split("\\|")));
        } else {
            setPictureSet(new ArrayList<String>());
        }
    }

    @JSONField(name = "pictures", serialzeFeatures = {SerializerFeature.WriteNullListAsEmpty})
    public List<String> getPictureSet () {
        return pictureSet;
    }

    public void setPictureSet (List<String> pictureSet) {
        if(pictureSet == null) {
            this.pictureSet = new ArrayList<>();
            this.pictures = "";
            return;
        }
        this.pictureSet = pictureSet;
        StringBuffer sBuffer = new StringBuffer();
        for (String picture:pictureSet) {
            sBuffer.append(picture).append('|');
        }
        sBuffer.deleteCharAt(sBuffer.length()-1);
        this.pictures = sBuffer.toString();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTag1() {
        return tag1;
    }

    public void setTag1(String tag1) {
        this.tag1 = tag1 == null ? null : tag1.trim();
    }

    public String getTag2() {
        return tag2;
    }

    public void setTag2(String tag2) {
        this.tag2 = tag2 == null ? null : tag2.trim();
    }

    public String getTag3() {
        return tag3;
    }

    public void setTag3(String tag3) {
        this.tag3 = tag3 == null ? null : tag3.trim();
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName == null ? null : brandName.trim();
    }

    public String getModelNumber() {
        return modelNumber;
    }

    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber == null ? null : modelNumber.trim();
    }

    public String getCertification() {
        return certification;
    }

    public void setCertification(String certification) {
        this.certification = certification == null ? null : certification.trim();
    }

    public String getPlaceOfOrigin() {
        return placeOfOrigin;
    }

    public void setPlaceOfOrigin(String placeOfOrigin) {
        this.placeOfOrigin = placeOfOrigin == null ? null : placeOfOrigin.trim();
    }

    public String getMinOrderQty() {
        return minOrderQty;
    }

    public void setMinOrderQty(String minOrderQty) {
        this.minOrderQty = minOrderQty == null ? null : minOrderQty.trim();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getPaymentTerms() {
        return paymentTerms;
    }

    public void setPaymentTerms(String paymentTerms) {
        this.paymentTerms = paymentTerms == null ? null : paymentTerms.trim();
    }

    public String getSupplyAbility() {
        return supplyAbility;
    }

    public void setSupplyAbility(String supplyAbility) {
        this.supplyAbility = supplyAbility == null ? null : supplyAbility.trim();
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime == null ? null : deliveryTime.trim();
    }

    public String getPackagingDetails() {
        return packagingDetails;
    }

    public void setPackagingDetails(String packagingDetails) {
        this.packagingDetails = packagingDetails == null ? null : packagingDetails.trim();
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}