package com.bruceTim.web.util.mail;

import com.bruceTim.web.model.Email;
import com.bruceTim.web.util.PropertyConfigurer;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;




import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.HashMap;

/**
 * Created by BruceTim on 2017/1/10.
 */
@Service
public class EmailUtils {

	Logger logger = Logger.getLogger(getClass());
	
    @Autowired
    private JavaMailSenderImpl senderImpl;

    @Autowired
    private VelocityEngine velocityEngine;


    @Autowired
    private PropertyConfigurer propertyConfigurer;
    
    public JavaMailSenderImpl getMailSenderImpl(){
    	return senderImpl;
    }
    
    /**
     * 创建MimeMessage
     * @param email
     * @return
     * @throws MessagingException
     * @throws UnsupportedEncodingException
     */
    public MimeMessage createMimeMessage(Email email, String realPath) throws MessagingException, UnsupportedEncodingException{
    	
    	//获取转发邮箱信息  
        String transfer = senderImpl.getUsername();
    	logger.debug("***from: " + email.getSender());
    	logger.debug("***to: " + email.getReceiver());
    	logger.debug("***transfer: " + transfer);
        MimeMessage mimeMessage = senderImpl.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
        messageHelper.setFrom(transfer, "精力塑料厂服务器代发");
        messageHelper.setSubject(email.getSender() + " : " +email.getSubject());
        messageHelper.setTo(email.getReceiver());
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("sender", email.getSender());
        model.put("subject", email.getSubject());
        model.put("content", email.getContent());
        model.put("senderName", email.getSenderName());
        model.put("company", email.getSenderCompany());
        model.put("tellphone", email.getSenderPhone());
        model.put("fax", email.getSenderFax());
        model.put("website", email.getWebsite());
        String country = (String) propertyConfigurer.getProperty("country." + email.getSenderCountry());
        model.put("country", country);
        model.put("priceTerms", email.getPriceTerms());
        model.put("payment", email.getPayment());
        model.put("initialOrder", email.getInitialOrder());
        model.put("sampleTerms", email.getSampleTerms());
        model.put("specification", email.getSpecification() ? "是" : "否");
        model.put("companyDescription", email.getCompanyDescription() ? "是" : "否");
        model.put("deliverTime", email.getDeliverTime() ? "是" : "否");
        model.put("urgent", email.getUrgent() ? "是" : "否");
        if(email.getUrgent()){
            model.put("emergency", "要求24小时内回复！请尽快处理！");
        }else {
            model.put("emergency", "");
        }
        String mailText = VelocityEngineUtils.mergeTemplateIntoString(
                velocityEngine, "mail.vm", "utf-8", model);
        
        // true 表示启动HTML格式的邮件
        messageHelper.setText(mailText, true);

        if (email.getFile1() != null ) {
            addFile(messageHelper, email.getFile1(), realPath);
        }

        if (email.getFile2() != null ) {
            addFile(messageHelper, email.getFile2(), realPath);
        }

        if (email.getFile3() != null ) {
            addFile(messageHelper, email.getFile3(), realPath);
        }

        return mimeMessage;
    }

    /**
     * 添加附件
     * @param messageHelper
     * @param fileUrl
     * @param realPath
     * @throws MessagingException
     */
    private void addFile(MimeMessageHelper messageHelper, String fileUrl, String realPath) throws MessagingException{
        FileSystemResource file = new FileSystemResource(
                new File(realPath + fileUrl));
        // 这里的方法调用和插入图片是不同的。
        messageHelper.addAttachment(fileUrl.substring(fileUrl.lastIndexOf('/'), fileUrl.length()), file);
    }

    public void sendMail(Email email, String realPath) throws UnsupportedEncodingException, MessagingException{
        MimeMessage msg = createMimeMessage(email, realPath);
        senderImpl.send(msg);
    }

}
