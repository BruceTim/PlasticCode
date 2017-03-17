package com.bruceTim.web.dao;

import com.bruceTim.core.generic.GenericDao;
import com.bruceTim.web.model.User;

public interface UserMapper extends GenericDao<User, Long> {
    int insert (User record);

    User selectBySelective (User user);

    int updateByPrimaryKey (User record);

}