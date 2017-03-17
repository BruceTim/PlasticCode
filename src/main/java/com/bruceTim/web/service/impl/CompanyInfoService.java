package com.bruceTim.web.service.impl;

import com.bruceTim.web.model.Company;
import com.bruceTim.web.model.ContactUs;
import com.bruceTim.web.model.FactoryTour;
import com.bruceTim.web.model.QualityControl;
import com.bruceTim.web.service.PropertiesService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by BruceTim on 2017/1/12.
 */
@Component
public class CompanyInfoService implements InitializingBean {

    @Resource
    private PropertiesService propertiesService;

    @Override
    public void afterPropertiesSet () throws Exception {

        String companyStr = propertiesService.selectByName("company");
        String factoryStr = propertiesService.selectByName("factoryTour");
        String qualityStr = propertiesService.selectByName("qualityControl");
        String contactStr = propertiesService.selectByName("contact");

        Company.getInstance().setValue(companyStr);
        FactoryTour.getInstance().setValue(factoryStr);
        QualityControl.getInstance().setValue(qualityStr);
        ContactUs.getInstance().setValue(contactStr);

    }
}
