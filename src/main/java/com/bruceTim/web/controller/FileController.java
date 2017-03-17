package com.bruceTim.web.controller;

import com.bruceTim.core.util.FileUploadUtil;
import com.bruceTim.web.util.GlobalData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by BruceTim on 2016/12/19.
 */
@Controller
@RequestMapping("/files")
public class FileController {

    /**
     * ckeditor图片上传
     *
     * @Title imageUpload
     * @param request
     * @param response
     */
    @RequestMapping("pictures/upload/ckeditor")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        try {

            FileUploadUtil.ckeditor(request, response, GlobalData.FILE_UPLOAD_PATH_PRODUCT);

        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
