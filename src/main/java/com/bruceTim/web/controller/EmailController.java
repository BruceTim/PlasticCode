package com.bruceTim.web.controller;

import com.alibaba.fastjson.JSON;
import com.bruceTim.core.entity.JSONResult;
import com.bruceTim.core.entity.Result;
import com.bruceTim.web.model.ContactUs;
import com.bruceTim.web.util.mail.EmailUtils;
import com.bruceTim.core.util.FileUploadUtil;
import com.bruceTim.web.enums.EmailState;
import com.bruceTim.web.model.Email;
import com.bruceTim.web.model.User;
import com.bruceTim.web.service.EmailService;
import com.bruceTim.web.util.GlobalData;
import com.bruceTim.web.util.PropertyConfigurer;
import com.github.pagehelper.PageInfo;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * Created by BruceTim on 2016/12/13.
 */
@Controller
@RequestMapping("/emails")
public class EmailController {

    Logger logger = Logger.getLogger(getClass());

    @Resource
    private EmailService emailService;
    @Autowired
    private EmailUtils emailUtils;
    
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String add(final Email email, @RequestParam(value = "file", required = false) CommonsMultipartFile[] files, HttpServletRequest request){
        try{
            String sfileUrls = FileUploadUtil.upload(files, GlobalData.FILE_UPLOAD_PATH_EMAIL, request);

            final String realPath = request.getServletContext().getRealPath("/");
            String[] fileUrls = sfileUrls.split("\\|");
            if (fileUrls.length == 1 && !"".equals(fileUrls[0])) {
                email.setFile1(fileUrls[0]);
            } else if (fileUrls.length == 2) {
                email.setFile1(fileUrls[0]);
                email.setFile2(fileUrls[1]);
            } else if (fileUrls.length > 2) {
                email.setFile1(fileUrls[0]);
                email.setFile2(fileUrls[1]);
                email.setFile3(fileUrls[2]);
            }
            email.setCreateTime(new Date());
            email.setReceiver(ContactUs.getInstance().getEmail());
            email.setTransfer(emailUtils.getMailSenderImpl().getUsername());
            
            final Email email1 = email;

            new Thread(new Runnable() {
                @Override
                public void run () {
                    try{
                    	logger.info(email.getTransfer() + " send email : " + email.getSender() + " -->" + email.getReceiver());
                        emailUtils.sendMail(email1, realPath);
                    } catch (UnsupportedEncodingException e) {
                        logger.error(e.getMessage());
                    }catch (MessagingException ex) {
                        logger.error(ex.getMessage());
                    }
                }
            }).start();

            int rs = emailService.insert(email);

            if (rs > 0) {
                return JSON.toJSONString(new Result("Success", 0, true));
            }
            return JSON.toJSONString(new Result("Fail", 1, false));
        } catch (Exception e) {
            logger.error(e.getMessage());
            return JSON.toJSONString(new Result("Fail", 1, false));
        }
    }

    @RequestMapping(value = "/{id}/detail", method = RequestMethod.GET)
    public String toDetail(@PathVariable("id") Long id, User user, Model model) {
        if (user == null) {
            return "../admin/login";
        }
        Email email = emailService.readEmail(id);
        String country = PropertyConfigurer.getProperty("country." + email.getSenderCountry());
        email.setSenderCountry(country);
        model.addAttribute("email", email);
        return "admin/email";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String detail(@PathVariable("id") Long id, User user) {
        if (user == null) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 100001, false));
        }
        Email email = emailService.readEmail(id);
        return JSON.toJSONString(new JSONResult<>(email, "Success", true));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public String update(@PathVariable("id") Long id, @RequestParam(value = "state", defaultValue = "1") int state, HttpSession session) {
        User user = (User)session.getAttribute("userInfo");
        if (user == null) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 100001, false));
        }
        int rs = 0;
        if (id > 0) {
            Email email = new Email();
            email.setId(id);
            email.setState(EmailState.value(state));
            rs = emailService.update(email);
        } else {
            rs = emailService.updateAll(state);
        }
        if (rs > 0) {
            return JSON.toJSONString(new Result("Success", 0, true));
        }
        return JSON.toJSONString(new Result("Fail", 1, false));
    }

    @RequestMapping(value = "/states", method = RequestMethod.GET)
    @ResponseBody
    public String states(@ModelAttribute User user) {
        return EmailState.valuesForJson();
    }

    @RequestMapping(value = "/states/{state}", method = RequestMethod.GET)
    @ResponseBody
    public String queryForState(@PathVariable("state") int state, HttpSession session, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User user = (User)session.getAttribute("userInfo");
        if (user == null) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 100001, false));
        }
        PageInfo<Email> pageInfo = null;
        if (state > 0) {
        	pageInfo = emailService.selectByState(EmailState.value(state), pageNum, pageSize);
        } else {
        	pageInfo = emailService.selectAll( pageNum, pageSize);
        }
        return JSON.toJSONString(new JSONResult<>(pageInfo, "Success", true));
    }

}

