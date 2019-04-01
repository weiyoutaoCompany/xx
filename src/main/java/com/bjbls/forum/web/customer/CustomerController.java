package com.bjbls.forum.web.customer;

import com.bjbls.forum.model.Customer;
import com.bjbls.forum.model.exception.MyFormException;
import com.bjbls.forum.service.CustomerService;
import com.bjbls.forum.service.Send_TypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
    @Resource
    private CustomerService customerService;
    //跳转首页"redirect:/index.jsp"
    @RequestMapping(value = "/index")
    public  String index(){


        return "redirect:/";
    }
    //跳转列表页面
    @RequestMapping(value = "/list")
    public  String list(HttpServletRequest request){
        request.setAttribute("list",customerService.getCustomer());

        return "/customer/list.jsp";
    }
    //跳转登录页面

    @RequestMapping(value = "/login1")
    public  String login1(){
        return "/customer/login.jsp";
    }
    //跳转注册页面
    @RequestMapping(value = "/signup")
    public  String signup(){
        return "/customer/signup.jsp";
    }

    /*
	 * 跳转到登录成功页面，
	 */
    @ResponseBody
    @RequestMapping(value = "/login")
    public Map<String,Integer>  login(String username, String password,HttpSession session){
        Map<String,Integer> map=new HashMap<String,Integer>();//定义一个map集合

        if(customerService.login(username, password)){
            //将登录的用户数据传完前台
        Customer customer=customerService.login1(username, password);

        session.setAttribute("customer",customer);
            map.put("status", 1);

    }else{
            map.put("status", -1);
    }
    return  map;

    }
    //注册
    @ResponseBody
    @RequestMapping(value = "/add")
    public  Map<String,Object>  add(Customer customer){



        Map<String, Object> map=new HashMap<String, Object>();
        try {

            customerService.add(customer);
            map.put("status", 1);
            map.put("myMessage", "账户添加成功");
        } catch (MyFormException e) {
            map.put("status", -1);
            map.put("myMessage", e.getMessage());
        }

        return  map;
    }

    //更新密码
    @ResponseBody
    @RequestMapping(value = "/updatePassword")
    public  Map<String,Integer> updatePawword(String password,Integer id){
        Map<String,Integer> map=new HashMap<>();

        if (customerService.updatePassword(password,id)){

            map.put("status", 1);

        }else {
            map.put("status", -1);
        }
        return  map;
    }
    //删除
    @ResponseBody
    @RequestMapping(value = "/delete")
    public  String deleteCustomer(Integer id){
        customerService.deleteCustomer(id);
        return "/customer/list";
    }
    //查询编辑页面
    @ResponseBody
    @RequestMapping(value = "/edit")
    public  String getCustomer(Integer id){
        customerService.getCustomer(id);
        return "/customer/customeredit.jsp";
    }
    //删除session

    @RequestMapping(value = "/deletecus")
    public  String deleteid(HttpSession session){
        session.removeAttribute("customer");
        return "redirect:/index.jsp";
    }
    //个人中心
    @RequestMapping(value = "myset")
    public  String myset(HttpSession session){
        if (session.getAttribute("customer")==null){
            return "customer/login.jsp";
        }else {

            return "customer/myset.jsp";
        }
    }
    //
    /**
     * 对用户信息进行修改
     */
    @ResponseBody
    @RequestMapping(value = "/editUpdate")
    public Map<String, Object> doUpdateAdmin(Customer customer,HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", -1);//默认失败
        try {
            if(customerService.updateCustomer(customer)){
                map.put("status", 1);
                map.put("myMessage", "账户编辑成功");
                request.setAttribute("customer",customer);

            }else{
                map.put("myMessage", "账户编辑失败");
            }
        }catch (MyFormException e){
            map.put("myMessage", e.getMessage());
        }

        return map;
    }
}
