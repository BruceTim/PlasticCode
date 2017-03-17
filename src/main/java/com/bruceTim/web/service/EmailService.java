package com.bruceTim.web.service;

import com.bruceTim.core.generic.GenericService;
import com.bruceTim.web.enums.EmailState;
import com.bruceTim.web.model.Email;
import com.github.pagehelper.PageInfo;

/**
 * Created by BruceTim on 2016/12/12.
 */
public interface EmailService  extends GenericService<Email, Long> {

    Email readEmail(Long id);

    int updateAll(int state);

    PageInfo<Email> selectAll(int pageNum, int pageSize);

    PageInfo<Email> selectByState(EmailState state, int pageNum, int pageSize);
}
