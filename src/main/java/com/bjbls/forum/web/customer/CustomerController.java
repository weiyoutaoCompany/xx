package com.bjbls.forum.web.customer;

import com.bjbls.forum.model.Customer;
import com.bjbls.forum.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
    @Resource
    private CustomerService customerService;


    /*
	 * 跳转到登录页面
	 */
    @ResponseBody
    @RequestMapping(value = "/login")
    public Map<String,Integer>  login(String username, String password){
        Map<String,Integer> map=new HashMap<String,Integer>();//定义一个map集合
        if(customerService.login(username, password)){
            map.put("status", 1);
    }else{
            map.put("status", -1);
    }
    return  map;

    }
    //注册
    @ResponseBody
    @RequestMapping(value = "/add")
    public  Map<String,Integer>  add(ModelMap map,Customer customer){

        Map<String,Integer> map1=new HashMap<>();
        if (customerService.add(customer)){

            map1.put("status", 1);

        }else {
            map1.put("status", -1);
        }
        return  map1;
    }

}
