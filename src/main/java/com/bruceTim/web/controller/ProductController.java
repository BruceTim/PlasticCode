package com.bruceTim.web.controller;

import com.alibaba.fastjson.JSON;
import com.bruceTim.core.entity.JSONResult;
import com.bruceTim.core.entity.Result;
import com.bruceTim.core.util.FileUploadUtil;
import com.bruceTim.web.model.Product;
import com.bruceTim.web.model.User;
import com.bruceTim.web.service.AdviceService;
import com.bruceTim.web.service.ProductService;
import com.bruceTim.web.util.GlobalData;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by BruceTim on 2016/12/13.
 */
@Controller
@RequestMapping("/products")
public class ProductController {

    private Logger log = Logger.getLogger(getClass());

    @Resource
    private ProductService productService;

    @Resource
    private AdviceService adviceService;

    @RequestMapping(value = "/view")
    public String viewAll(Model model) {
        model.addAttribute("queryType", "all");
        return "products";
    }

    @RequestMapping(value = "/categories/{id}/amount", method = RequestMethod.GET)
    @ResponseBody
    public String getAmount(@PathVariable("id") Long id) {
        int amount = productService.selectAmountByCategoryId(id);
        return JSON.toJSONString(new JSONResult<Integer>(amount, "Success", true));
    }

    @RequestMapping(value = "/categories/{id}/view")
    public String viewByCategory(@PathVariable(value = "id") Long id, Model model) {
        model.addAttribute("queryType", id);
        return "products";
    }

    @RequestMapping(value = "/categories/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String queryByCategoryId(@PathVariable("id") Long id, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {

        PageInfo<Product> pageInfo = productService.selectListByCategoryId(id, pageNum, pageSize);
        return JSON.toJSONString(new JSONResult<PageInfo>(pageInfo, "Success", true));
    }

    @RequestMapping(value = "/{id}/view")
    public String viewById(@PathVariable(value = "id") Long id, Model model) {
        model.addAttribute("productId", id);
        model.addAttribute("queryType", "detail");
        return "detail";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String detail(@PathVariable("id") Long id) {
        Product product = productService.selectById(id);
        return JSON.toJSONString(new JSONResult<>(product, "Success", true));
    }

    @RequestMapping(value = "/{id}/detail", method = RequestMethod.GET)
    public String goDetail(@PathVariable("id") Long id, Model model) {
        model.addAttribute("productId", id);
        return "admin/product";
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String add(Product product, HttpSession session, @RequestParam(value = "file", required = false)CommonsMultipartFile[] files, HttpServletRequest request) {
        User user = (User)session.getAttribute("userInfo");
        if (user == null) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 100001, false));
        }
        try {
            String pictureUrls = FileUploadUtil.uploadPictures(files, GlobalData.FILE_UPLOAD_PATH_PRODUCT, request);
            product.setPictures(pictureUrls);
            product.setCreateTime(new Date());
            long rs = productService.insertAndGetId(product);
            if (rs > 0) {
                return JSON.toJSONString(new JSONResult<>(rs, "Success", true));
            }
            return JSON.toJSONString(new Result("Fail", 500, false));
        } catch (Exception e) {
            log.error(e.getMessage());
            return JSON.toJSONString(new Result("Fail", 500, false));
        }
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String update(@RequestParam(value = "file", required = false) CommonsMultipartFile[] files, @PathVariable("id") Long id, Product product, HttpSession session, HttpServletRequest request) {
        User user = (User)session.getAttribute("userInfo");
        if (user == null) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 100001, false));
        }
        try {
            if(files !=null){
                String pictureUrls = FileUploadUtil.uploadPictures(files, GlobalData.FILE_UPLOAD_PATH_PRODUCT, request);
                if (!"".equals(pictureUrls)) {
                    if(product.getPictures() == null || "".equals(product.getPictures())){
                        product.setPictures(pictureUrls);
                    } else {
                        product.setPictures(product.getPictures() + "|" + pictureUrls);
                    }
                }
            }

            int rs = productService.update(product);
            if (rs > 0) {
                return JSON.toJSONString(new JSONResult<>(id, "Success", true));
            }
            return JSON.toJSONString(new Result("Fail", 1, false));
        } catch (Exception ex) {
            log.error(ex.getMessage());
            return JSON.toJSONString(new Result("Fail", 500, false));
        }
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String delete(@PathVariable("id") Long id, HttpSession session) {
        User user = (User)session.getAttribute("userInfo");
        if (user == null) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 100001, false));
        }
        int rs = productService.delete(id);
        if (rs > 0) {
            return JSON.toJSONString(new Result("Success", 0, true));
        }
        return JSON.toJSONString(new Result("Fail", 1, false));
    }

    @RequestMapping(value = "/categories/{id}/advices", method = RequestMethod.GET)
    @ResponseBody
    public String queryAdvice(@PathVariable("id") Long id) {
        List<Product> list = productService.selectAdviceListByCategoryId(id);
        return JSON.toJSONString(new JSONResult<List>(list, "Success", true));
    }

    @RequestMapping(value = "/categories/{id}/advices", method = RequestMethod.PUT)
    @ResponseBody
    public String updateAdvice(@PathVariable("id") Long id, @RequestParam(value = "productIds", defaultValue = "") long[] productIds, @ModelAttribute User user ) {
        if (user == null) {
            return JSON.toJSONString(new Result("你还未登录，请先登录！", 100001, false));
        }
        int rs = adviceService.insert(id, productIds);
        if (rs > 0) {
            return JSON.toJSONString(new Result("Success", 0, true));
        }
        return JSON.toJSONString(new Result("Fail", 1, false));
    }

    @RequestMapping(value = "/categories/{id}/search/view", method = RequestMethod.GET)
    public String viewSearch(@PathVariable("id") Long id,
                         @RequestParam(value = "keyword", defaultValue = "") String keyword,
                         Model model) {
    	model.addAttribute("queryType", "search");
        model.addAttribute("keyword", keyword);
        model.addAttribute("cateid", id);
        return "products";
    }
    
    @RequestMapping(value = "/categories/{id}/search", method = RequestMethod.GET)
    @ResponseBody
    public String search(@PathVariable("id") Long id,
                         @RequestParam(value = "keyword", defaultValue = "") String name,
                         @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                         @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageInfo<Product> pageInfo = productService.selectListByCategoryIdAndName(id, name, pageNum, pageSize);
        return JSON.toJSONString(new JSONResult<PageInfo>(pageInfo, "Success", true));
    }

    @RequestMapping("/tags/{tag}/view")
    public String viewByTags(@PathVariable("tag") String tag, Model model) {
        model.addAttribute("queryType", "tag");
        model.addAttribute("tag", tag);
        return "products";
    }

    @RequestMapping(value = "/tags/{tag}", method = RequestMethod.GET)
    @ResponseBody
    public String queryByTags(@PathVariable("tag") String tag, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        tag = tag.replaceAll("_", " ");
    	PageInfo<Product> pageInfo = productService.selectListByTag(tag, pageNum, pageSize);
        return JSON.toJSONString(new JSONResult<PageInfo>(pageInfo, "Success", true));
    }
}
