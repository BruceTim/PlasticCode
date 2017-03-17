package com.bruceTim.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bruceTim.core.entity.JSONResult;
import com.bruceTim.core.entity.Result;
import com.bruceTim.core.util.FileUploadUtil;
import com.bruceTim.web.model.*;
import com.bruceTim.web.service.PropertiesService;
import com.bruceTim.web.util.GlobalData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

/**
 * Created by BruceTim on 2017/1/12.
 */
@Controller
@RequestMapping("company")
public class CompanyInfoController {

    @Resource
    private PropertiesService propertiesService;

    @RequestMapping(value = "/aboutus", method = RequestMethod.GET)
    @ResponseBody
    public String getCompanyDetail(){
        JSONObject jsonObject = Company.getInstance().toJSONObject();
        String result = JSON.toJSONString(new JSONResult<>(jsonObject));
        return result;
    }

    @RequestMapping(value = "/aboutus", method = RequestMethod.POST)
    @ResponseBody
    public String updateCompanyDetail(@RequestParam(value = "file", required = false) CommonsMultipartFile[] files, HttpServletRequest request){

        try{
            String companyName = request.getParameter("companyName");
            String detail = request.getParameter("detail");
            String businessType = request.getParameter("businessType");
            String mainMarket = request.getParameter("mainMarket");
            String brand = request.getParameter("brand");
            String employees = request.getParameter("employees");
            String established = request.getParameter("established");
            String export = request.getParameter("export");
            String introduction = request.getParameter("introduction");
            String history = request.getParameter("history");
            String service = request.getParameter("service");
            String team = request.getParameter("team");
            String[] pictures = request.getParameterValues("pictures");

            String pictureUrls = FileUploadUtil.upload(files, GlobalData.FILE_UPLOAD_PATH_COMPANY, request);

            Company company = Company.getInstance();
            company.setCompanyName(companyName);
            company.setDetail(detail);
            company.setBusinessType(businessType);
            company.setMainMarket(mainMarket);
            company.setBrand(brand);
            company.setEmployees(employees);
            company.setEstablished(established);
            company.setExport(export);
            company.setIntroduction(introduction);
            company.setHistory(history);
            company.setService(service);
            company.setTeam(team);
            if(pictures.length == 1 && "".equals(pictures[0])){
                company.setPictures(new ArrayList<String>());
            }else {
                company.setPictures(Arrays.asList(pictures));
            }

            company.addPictures(pictureUrls);
            int rs = propertiesService.updateByName("company",JSON.toJSONString(Company.getInstance().toJSONObject()));

            if(rs > 0){
                return JSON.toJSONString(new Result("Success", 0, true));
            }
            return JSON.toJSONString(new Result("Fail", 1, false));
        } catch (IOException e) {
            e.printStackTrace();
            return JSON.toJSONString(new Result("Fail", 1, false));
        }
    }

    @RequestMapping(value = "/factoryTour", method = RequestMethod.GET)
    @ResponseBody
    public String getFactoryTour(){
        JSONObject jsonObject = FactoryTour.getInstance().toJSONObject();
        String result = JSON.toJSONString(new JSONResult<>(jsonObject));
        return result;
    }

    @RequestMapping(value = "/factoryTour", method = RequestMethod.POST)
    @ResponseBody
    public String updateFactoryTour(@RequestParam(value = "file1", required = false) CommonsMultipartFile[] files1,
                                    @RequestParam(value = "file2", required = false) CommonsMultipartFile[] files2,
                                    @RequestParam(value = "file3", required = false) CommonsMultipartFile[] files3,
                                    @RequestParam(value = "file4", required = false) CommonsMultipartFile[] files4,
                                    HttpServletRequest request){

        try {
            String[] pictures1 = request.getParameterValues("pictures1");
            String[] pictures2 = request.getParameterValues("pictures2");
            String[] pictures3 = request.getParameterValues("pictures3");
            String[] pictures4 = request.getParameterValues("pictures4");

            String pictureUrls1 = FileUploadUtil.upload(files1, GlobalData.FILE_UPLOAD_PATH_COMPANY, request);
            String pictureUrls2 = FileUploadUtil.upload(files2, GlobalData.FILE_UPLOAD_PATH_COMPANY, request);
            String pictureUrls3 = FileUploadUtil.upload(files3, GlobalData.FILE_UPLOAD_PATH_COMPANY, request);
            String pictureUrls4 = FileUploadUtil.upload(files4, GlobalData.FILE_UPLOAD_PATH_COMPANY, request);

            FactoryTour factoryTour = FactoryTour.getInstance();

            if(pictures1.length == 1 && "".equals(pictures1[0])){
                factoryTour.setPictures1(new ArrayList<String>());
            }else {
                factoryTour.setPictures1(Arrays.asList(pictures1));
            }
            if(pictures2.length == 1 && "".equals(pictures2[0])){
                factoryTour.setPictures2(new ArrayList<String>());
            }else {
                factoryTour.setPictures2(Arrays.asList(pictures2));
            }
            if(pictures3.length == 1 && "".equals(pictures3[0])){
                factoryTour.setPictures3(new ArrayList<String>());
            }else {
                factoryTour.setPictures3(Arrays.asList(pictures3));
            }
            if(pictures4.length == 1 && "".equals(pictures4[0])){
                factoryTour.setPictures4(new ArrayList<String>());
            }else {
                factoryTour.setPictures4(Arrays.asList(pictures4));
            }
            factoryTour.addPictures1(pictureUrls1);
            factoryTour.addPictures2(pictureUrls2);
            factoryTour.addPictures3(pictureUrls3);
            factoryTour.addPictures4(pictureUrls4);

            int rs = propertiesService.updateByName("factoryTour",JSON.toJSONString(factoryTour.toJSONObject()));

            if(rs > 0){
                return JSON.toJSONString(new Result("Success", 0, true));
            }
            return JSON.toJSONString(new Result("Fail", 1, false));
        }catch (IOException e) {
            e.printStackTrace();
            return JSON.toJSONString(new Result("Fail", 1, false));
        }
    }

    @RequestMapping(value = "/qualityControl", method = RequestMethod.GET)
    @ResponseBody
    public String getQualityControl(){
        JSONObject jsonObject = QualityControl.getInstance().toJSONObject();
        String result = JSON.toJSONString(new JSONResult<>(jsonObject));
        return result;
    }

    @RequestMapping(value = "/qualityControl", method = RequestMethod.POST)
    @ResponseBody
    public String updateQualityControl(@RequestParam(value = "file", required = false) CommonsMultipartFile[] files, HttpServletRequest request){

        try{
            String standard = request.getParameter("standard");
            String number = request.getParameter("number");
            String issueDate = request.getParameter("issueDate");
            String expiryDate = request.getParameter("expiryDate");
            String content = request.getParameter("content");
            QualityControl qualityControl = QualityControl.getInstance();
            String pictureUrls = FileUploadUtil.upload(files, GlobalData.FILE_UPLOAD_PATH_COMPANY, request);
            if(!"".equals(pictureUrls)){
                qualityControl.setPicture(pictureUrls);
            }

            qualityControl.setStandard(standard);
            qualityControl.setNumber(number);
            qualityControl.setIssueDate(issueDate);
            qualityControl.setExpiryDate(expiryDate);
            qualityControl.setContent(content);

            int rs = propertiesService.updateByName("qualityControl",JSON.toJSONString(qualityControl.toJSONObject()));

            if(rs > 0){
                return JSON.toJSONString(new Result("Success", 0, true));
            }
            return JSON.toJSONString(new Result("Fail", 1, false));
        } catch (IOException e) {
            e.printStackTrace();
            return JSON.toJSONString(new Result("Fail", 1, false));
        }
    }

    @RequestMapping(value = "/contactus", method = RequestMethod.GET)
    @ResponseBody
    public String getContactus(){
        JSONObject jsonObject = ContactUs.getInstance().toJSONObject();
        String result = JSON.toJSONString(new JSONResult<>(jsonObject));
        return result;
    }

    @RequestMapping(value = "/contactus", method = RequestMethod.POST)
    @ResponseBody
    public String updateContactus(User user, HttpServletRequest request){

        try{
            String address = request.getParameter("address");
            String faddress = request.getParameter("faddress");
            String workTime = request.getParameter("workTime");
            String tellPhone = request.getParameter("tellPhone");
            String fax = request.getParameter("fax");
            String contactPerson = request.getParameter("contactPerson");
            String jobTitle = request.getParameter("jobTitle");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

            ContactUs contactUs = ContactUs.getInstance();
            contactUs.setAddress(address);
            contactUs.setfAddress(faddress);
            contactUs.setFax(fax);
            contactUs.setWorkTime(workTime);
            contactUs.setTellPhone(tellPhone);
            contactUs.setContactPerson(contactPerson);
            contactUs.setJobTitle(jobTitle);
            contactUs.setPhone(phone);
            contactUs.setEmail(email);

            int rs = propertiesService.updateByName("contact",JSON.toJSONString(contactUs.toJSONObject()));

            if(rs > 0){
                return JSON.toJSONString(new Result("Success", 0, true));
            }
            return JSON.toJSONString(new Result("Fail", 1, false));
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString(new Result("Fail", 1, false));
        }
    }
}
