package com.bruceTim.web.controller;

import com.bruceTim.web.model.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 * 公共视图控制器
 * 
 * @author starzou
 * @since 2014年4月15日 下午4:16:34
 **/
@Controller
public class CommonController {

    Logger logger = Logger.getLogger(getClass());

    /**
     * 首页
     * 
     * @param request
     * @return
     */
    @RequestMapping("index")
    public String index(HttpServletRequest request) {
        return "index";
    }

    /**
     * 首页
     *
     * @param request
     * @return
     */
    @RequestMapping("admin/index")
    public String adminIndex(HttpSession session, HttpServletRequest request) {
        User user = (User)session.getAttribute("userInfo");
        if (user == null) {
            return "redirect:../admin/login";
        }
        return "admin/index";
    }

    /**
     * 现在联系我们
     *
     * @param model
     * @return
     */
    @RequestMapping("contactnow")
    public String contactnow(Model model,
           @RequestParam(value = "pid", defaultValue = "0", required = false) int pid,
           @RequestParam(value = "message", defaultValue = "", required = false) String message ) {
        model.addAttribute("pid", pid);
        model.addAttribute("message", message);
        return "contactnow";
    }

    /**
     *  关于我们
     * @param model
     * @return
     */
    @RequestMapping("aboutus")
    public String aboutus(Model model){
        return "aboutus";
    }

    /**
     *  关于我们
     * @param model
     * @return
     */
    @RequestMapping("factory")
    public String factory(Model model){
        return "factory";
    }

    /**
     *  关于我们
     * @param model
     * @return
     */
    @RequestMapping("quality")
    public String quality(Model model){
        return "quality";
    }

    /**
     *  关于我们
     * @param model
     * @return
     */
    @RequestMapping("contactus")
    public String contactus(Model model){
        return "contactus";
    }

    /**
     * 管理员验证页面
     */
    @RequestMapping("logs/{log}")
    public String logs(@PathVariable("log")String log, Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            log += ".log";
            String realPath = request.getServletContext().getRealPath("/WEB-INF/logs");
            File file = new File(realPath + "/" + log);
            response.reset();
            // 先去掉文件名称中的空格,然后转换编码格式为utf-8,保证不出现乱码,这个文件名称用于浏览器的下载框中自动显示的文件名
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(log.replaceAll(" ", "").getBytes("utf-8"),"iso8859-1"));
            response.addHeader("Content-Length", "" + file.length());
            response.setContentType("application/octet-stream");
            OutputStream out = response.getOutputStream();
            FileInputStream in = new FileInputStream(file);
            byte[] buffer = new byte[1024];
            int length = 0;
            while ((length = in.read(buffer)) > 0){
                out.write(buffer, 0 ,length);
            }

            out.flush();
            in.close();
            out.close();
        }catch (Exception e){
            logger.error(e.getMessage());
        }
        return "";
    }

    /**
     * 管理员验证页面
     */
    @RequestMapping("logs")
    public String logs() {
        return "redirect:security";
    }

    /**
     * 管理员验证页面
     */
    @RequestMapping("security")
    public String security() {
        return "securityLogin";
    }

    /**
     * 管理员登录验证
     */
    @RequestMapping(value = "security/login" , method = RequestMethod.POST)
    public String securityLogin(HttpServletRequest request, Model model) {
        String securityName = request.getParameter("securityName");
        String securityPwd = request.getParameter("securityPwd");
        if("admin".equals(securityName) && "bruce1992".equals(securityPwd)){
            String realPath = request.getServletContext().getRealPath("/WEB-INF/logs");
            File file = new File(realPath);
            String[] logs = file.list();
            model.addAttribute("logs", logs);
            return "logs";
        } else {
            return "404";
        }

    }

    /**
     * 登录页
     */
    @RequestMapping("admin/login")
    public String login() {
        return "admin/login";
    }

    /**
     * 登录页
     */
    @RequestMapping("admin/logout")
    public String logout(HttpSession session) {
        session.setAttribute("userInfo", null);
        session.setAttribute("username", "");
        return "admin/login";
    }

    /**
     * 404页
     */
    @RequestMapping("404")
    public String error404() {
        return "404";
    }

    /**
     * 401页
     */
    @RequestMapping("401")
    public String error401() {
        return "401";
    }

    /**
     * 500页
     */
    @RequestMapping("500")
    public String error500() {
        return "500";
    }
}