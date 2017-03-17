package com.bruceTim.core.util;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bruceTim.core.entity.Picture;
import org.apache.commons.io.FileUtils;
import org.apache.http.client.utils.DateUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import sun.misc.BASE64Decoder;

/**
 * Created by BruceTim on 2016/12/19.
 */
public class FileUploadUtil {
    // 图片类型
    private static List<String> fileTypes = new ArrayList<String>();

    static {
        fileTypes.add(".jpg");
        fileTypes.add(".jpeg");
        fileTypes.add(".bmp");
        fileTypes.add(".gif");
        fileTypes.add(".png");
    }

    /**
     * 图片上传
     *
     * @Title upload
     * @param request
     * @param DirectoryName
     *            文件上传目录：比如upload(无需带前面的/) upload/news ..
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static String upload(HttpServletRequest request, String DirectoryName) throws IllegalStateException,
            IOException, Exception {
        String fileName = "";
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession()
                .getServletContext());
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 记录上传过程起始时的时间，用来计算上传时间
                // int pre = (int) System.currentTimeMillis();
                // 取得上传文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    // 取得当前上传文件的文件名称
                    String originalFilename = file.getOriginalFilename();
                    // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
                    if (originalFilename.trim() != "") {
                        // 获得图片后缀名称,如果后缀不为图片格式，则不上传
                        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
                        if (!fileTypes.contains(suffix)) {
                            continue;
                        }
                        // 获得上传路径的绝对路径地址(/upload)-->
                        String realPath = request.getSession().getServletContext().getRealPath("/" + DirectoryName);
                        System.out.println(realPath);
                        // 如果路径不存在，则创建该路径
                        File realPathDirectory = new File(realPath);
                        if (realPathDirectory == null || !realPathDirectory.exists()) {
                            realPathDirectory.mkdirs();
                        }
                        // 重命名上传后的文件名 111112323.jpg
                        fileName = originalFilename.substring(0,originalFilename.lastIndexOf(".")) + DateUtils.formatDate(new Date(), "yyyyMMddHHmmss") + suffix;
                        // 定义上传路径 .../upload/111112323.jpg
                        File uploadFile = new File(realPathDirectory + "\\" + fileName);
//                        System.out.println(uploadFile);
                        file.transferTo(uploadFile);
                    }

                    return fileName;
                }
                // 记录上传该文件后的时间
                // int finaltime = (int) System.currentTimeMillis();
                // System.out.println(finaltime - pre);
            }
        }
        return "";
    }


    /**
     * 多文件上传
     *
     * @Title upload
     * @param files
     * @param directoryName
     *            文件上传目录：realpath/resources/img/ ..
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static String upload(CommonsMultipartFile[] files, String directoryName, HttpServletRequest request) throws IllegalStateException,
            IOException {

        if (files == null || files.length == 0) return "";
        String realPath = request.getSession().getServletContext().getRealPath(directoryName + "/");
        StringBuffer sBuffer = new StringBuffer();
        String fileName = "";
        // 判断 request 是否有文件上传,即多部分请求
        for (CommonsMultipartFile picture:files) {
            // 获得图片的原始名称
            String originalFilename = picture.getOriginalFilename();
            // 获得图片后缀名称,如果后缀不为图片格式，则不上传
            String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
            // 如果路径不存在，则创建该路径
            File realPathDirectory = new File(directoryName);
            if (realPathDirectory == null || !realPathDirectory.exists()) {
                realPathDirectory.mkdirs();
            }
            // 重命名上传后的文件名 111112323.jpg
            fileName = originalFilename.substring(0, originalFilename.lastIndexOf(".")) + DateUtils.formatDate(new Date(), "yyyyMMddHHmmss") + suffix;
            FileUtils.copyInputStreamToFile(picture.getInputStream(), new File(realPath, fileName));
            sBuffer.append(directoryName).append("/").append(fileName).append("|");
        }
        if (sBuffer.length() > 0) {
            sBuffer.deleteCharAt(sBuffer.length() - 1);
        }
        return sBuffer.toString();
    }

    /**
     * 多图片上传
     *
     * @Title upload
     * @param pictures
     * @param directoryName
     *            文件上传目录：realpath/resources/img/ ..
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static String uploadPictures(CommonsMultipartFile[] pictures, String directoryName, HttpServletRequest request) throws IllegalStateException,
            IOException {

        String realPath = request.getSession().getServletContext().getRealPath(directoryName + "/");
        StringBuffer sBuffer = new StringBuffer();
        String fileName = "";
        // 判断 request 是否有文件上传,即多部分请求
        for (CommonsMultipartFile picture:pictures) {
            // 获得图片的原始名称
            String originalFilename = picture.getOriginalFilename();
            // 获得图片后缀名称,如果后缀不为图片格式，则不上传
            String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
            if (!fileTypes.contains(suffix)) {
                continue;
            }
            // 如果路径不存在，则创建该路径
            File realPathDirectory = new File(directoryName);
            if (realPathDirectory == null || !realPathDirectory.exists()) {
                realPathDirectory.mkdirs();
            }
            // 重命名上传后的文件名 111112323.jpg
            fileName = originalFilename.substring(0, originalFilename.lastIndexOf(".")) + DateUtils.formatDate(new Date(), "yyyyMMddHHmmss") + suffix;
            FileUtils.copyInputStreamToFile(picture.getInputStream(), new File(realPath, fileName));
            sBuffer.append(directoryName).append("/").append(fileName).append("|");
        }
        sBuffer.deleteCharAt(sBuffer.length() - 1);
        return sBuffer.toString();
    }

    /**
     * ckeditor文件上传功能，回调，传回图片路径，实现预览效果。
     *
     * @Title ckeditor
     * @param request
     * @param response
     * @param directoryName
     *            文件上传目录：比如upload(无需带前面的/) upload/..
     * @throws IOException
     */
    public static void ckeditor(HttpServletRequest request, HttpServletResponse response, String directoryName)
            throws IOException, Exception{
        String fileName = upload(request, directoryName);
        // 结合ckeditor功能
        // imageContextPath为图片在服务器地址，如upload/123.jpg,非绝对路径
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        String imageContextPath = directoryName + "/" + fileName;
        response.setContentType("text/html;charset=UTF-8");
        String callback = request.getParameter("CKEditorFuncNum");
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + basePath + imageContextPath + "',''" + ")");
        out.println("</script>");
        out.flush();
        out.close();
    }
}