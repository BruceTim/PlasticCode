package com.bruceTim.web.service;

import com.bruceTim.web.model.User;
import com.bruceTim.core.generic.GenericService;

/**
 * 用户业务接口
 * Created by BruceTim on 2016/11/18.
 */
public interface UserService extends GenericService<User, Long> {

    /**
     * 根据用户名查用户
     *
     * @param username
     * @return
     */
    User selectByUsername (String username);

    User login(String username, String password);

}
