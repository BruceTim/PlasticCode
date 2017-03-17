package com.bruceTim.web.controller;

import com.alibaba.fastjson.JSON;
import com.bruceTim.core.entity.Result;
import com.bruceTim.core.util.PasswordHelper;
import com.bruceTim.web.service.UserService;
import com.bruceTim.web.model.User;
import com.bruceTim.web.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * UserController
 * Created by BruceTim on 2016/11/22.
 */
@Controller
@RequestMapping("/users")
public class UserController {

    @Resource
    private UserService userService;

    /**
     *  /users/login
     *  登陆操作
     * @param user
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest request) {

        try {
            User userInfo = userService.login(user.getUsername(), user.getPassword());
            // 验证成功在Session中保存用户信息
            HttpSession session = request.getSession();
            session.setAttribute("userInfo", userInfo);
            session.setAttribute("username", user.getUsername());
        } catch (UnknownAccountException e) {
            return "admin/login";
        }
        return "redirect:../admin/index";
    }

    /**
     * /users/id
     * 修改个人资料
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public String update(@PathVariable("id") Long id, HttpSession session, User user) {
        User userInfo = (User)session.getAttribute("userInfo");
        if (userInfo == null ) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 1, false));
        }
        if (user.getPassword() != null) {
            user.setSalt(userInfo.getSalt());
            user = PasswordHelper.changePassword(user, PasswordHelper.algorithmName_MD5, 2);
        }
        int rs = userService.update(user);
        if (rs > 0) {
            return JSON.toJSONString(new Result("资料修改成功", 0, true));
        }
        return JSON.toJSONString(new Result("资料修改成功", 1, false));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String detail(@PathVariable("id") Long id, @ModelAttribute User user) {
        if (user == null ) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 1, false));
        }
        user = userService.selectById(user.getId());
        return JSON.toJSONString(user);
    }
}
