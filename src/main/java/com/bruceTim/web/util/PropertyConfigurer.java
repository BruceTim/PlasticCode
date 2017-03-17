package com.bruceTim.web.util;

import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PreferencesPlaceholderConfigurer;

/**
 * Created by BruceTim on 2017/2/15.
 */
public class PropertyConfigurer extends PreferencesPlaceholderConfigurer {

	private static Properties properties;
	
	@Override  
    protected void processProperties(  
            ConfigurableListableBeanFactory beanFactoryToProcess,  
            Properties props) throws BeansException {  
        super.processProperties(beanFactoryToProcess, props);  
        properties = props;
    }  
    public static String getProperty(String name) {  
        return (String) properties.get(name);  
    }  
}
