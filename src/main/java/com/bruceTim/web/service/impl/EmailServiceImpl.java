package com.bruceTim.web.service.impl;

import com.bruceTim.core.generic.GenericDao;
import com.bruceTim.core.generic.GenericServiceImpl;
import com.bruceTim.web.dao.EmailMapper;
import com.bruceTim.web.enums.EmailState;
import com.bruceTim.web.model.Email;
import com.bruceTim.web.service.EmailService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.List;

/**
 * Created by BruceTim on 2016/12/12.
 */
@Service
public class EmailServiceImpl extends GenericServiceImpl<Email, Long> implements EmailService{

    @Resource
    private EmailMapper emailMapper;

    @Value("${mail.username}")
    private String transfer;
    
    @Override
    public GenericDao<Email, Long> getDao () {
        return emailMapper;
    }

    @Override
    public int insert(Email model) {
    	model.setTransfer(transfer);
    	return super.insert(model);
    }
    
    @Override
    public PageInfo<Email> selectAll (int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        PageHelper.orderBy("create_time desc");
        List<Email> list = emailMapper.selectAllForPage();
        PageInfo<Email> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public int updateAll (int state) {
        return emailMapper.updateAll(state);
    }

    @Override
    public PageInfo<Email> selectByState (EmailState state, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        PageHelper.orderBy("create_time desc");
        List<Email> list = emailMapper.selectByStateForPage(state.getValue());
        PageInfo<Email> page = new PageInfo<>(list);
        return page;
    }

    @Transactional
    @Override
    public Email readEmail (Long id) {
        Email email = emailMapper.selectByPrimaryKey(id);
        if (email.getState() == EmailState.UNREAD) {
            email.setState(EmailState.UNPROCESS);
            emailMapper.updateByPrimaryKey(email);
        }
        return email;
    }

    @Transactional
    @Override
    public int update (Email email) {
        return super.update(email);
    }

    @Override
    public Email selectById (Long id) {
        return super.selectById(id);
    }
}
