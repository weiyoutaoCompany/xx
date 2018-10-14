package com.bjbls.forum.web.system;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/system")
public class AdminController {
    //跳转首页
    @RequestMapping(value = "/index")
    public  String index(){


        return "system/index.jsp";
    }

}
