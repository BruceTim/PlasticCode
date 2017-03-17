package com.bruceTim.web.service.impl;

import com.bruceTim.core.generic.GenericDao;
import com.bruceTim.core.generic.GenericServiceImpl;
import com.bruceTim.core.util.PasswordHelper;
import com.bruceTim.web.dao.UserMapper;
import com.bruceTim.web.model.User;
import com.bruceTim.web.service.UserService;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by BruceTim on 2016/11/18.
 */
@Service
public class UserServiceImpl extends GenericServiceImpl<User, Long> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public GenericDao<User, Long> getDao () {
        return userMapper;
    }

    @Override
    public User selectByUsername (String username) {
        User user = new User();
        user.setUsername(username);
        return userMapper.selectBySelective(user);
    }

    @Override
    public User login (String username, String password) throws UnknownAccountException{
        User user = new User();
        user.setUsername(username);
        user = userMapper.selectBySelective(user);
        if (user == null) throw new UnknownAccountException();
        boolean flag = PasswordHelper.authPassword(user, PasswordHelper.algorithmName_MD5, 2, password);
        if (flag) {
            user.setPassword(password);
            return user;
        } else {
            throw new UnknownAccountException();
        }
    }
}
