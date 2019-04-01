package com.bjbls.forum.web;

import com.bjbls.forum.service.Send_TypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
    @Resource
    Send_TypeService send_typeService;
    @RequestMapping(value = "/index")
    public  String index(){


        return "redirect:/index.jsp";
    }
    @RequestMapping(value = "/help")
    public  String help(){

        return  "customer/help.jsp";
    }
    @RequestMapping(value = "/calendar")
    public  String calendar(){

        return  "customer/calendar.jsp";
    }
    @RequestMapping(value = "/guide")
    public  String guide(){

        return  "customer/guide.jsp";
    }
    @RequestMapping(value = "/404")
    public  String a(){

        return  "customer/404.jsp";
    }


    @RequestMapping(value = "/mypostreply")
    public  String mypostreply(){

        return  "customer/mypostreply.jsp";
    }

}
