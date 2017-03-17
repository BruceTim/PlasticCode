package com.bruceTim.web.dao;

import com.bruceTim.core.generic.GenericDao;
import com.bruceTim.web.enums.EmailState;
import com.bruceTim.web.model.Email;

import java.util.List;

public interface EmailMapper extends GenericDao<Email, Long>{

    int insert (Email record);

    int updateAll (int state);

    int updateByPrimaryKey (Email record);

    Email selectByPrimaryKeySelective(Email email);
    
    List<Email> selectByStateForPage(int state);

    List<Email> selectAllForPage();
}