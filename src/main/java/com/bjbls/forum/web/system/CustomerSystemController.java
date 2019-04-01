package com.bjbls.forum.web.system;


import com.bjbls.forum.model.Customer;
import com.bjbls.forum.model.Page;
import com.bjbls.forum.model.exception.MyFormException;
import com.bjbls.forum.service.CustomerService;
import com.bjbls.forum.service.PageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/systemcus")
public class CustomerSystemController {
    @Resource
    private CustomerService customerService;
    @Resource
    private PageService pageService;

    //跳转用户列表页面

    @RequestMapping(value = "/list")
    public  String list(ModelMap map,HttpServletRequest request, Page page){

        request.setAttribute("listAll",customerService.getCustomer());
        List<Customer> customers=new ArrayList<>();
        //存入查询哪一个表
        page.setTableName("customer");
        //根据传进来的当前页进行加减然后读取数据库的对应内容,存入session，前台显示
        customers=customerService.raadCus(pageService.afferentPage(page));
        request.setAttribute("page",pageService.outPage(page));
       request.setAttribute("list",customers);

        return "system/customermanage.jsp";
    }
    //跳转用户添加

    @RequestMapping(value = "/signup")
    public  String signup(){
        return "system/customeradd.jsp";
    }
    //添加用户
    @ResponseBody
    @RequestMapping(value = "/add")
    public  Map<String,Object>  add(Customer customer) {
        Map<String, Object> map=new HashMap<String, Object>();
        try {
           customerService.add(customer);
            map.put("status", 1);
            map.put("myMessage", "账户添加成功");
        } catch (MyFormException e) {
            map.put("status", -1);
            map.put("myMessage", e.getMessage());
        }
        return map;
    }
    /**
     * 跳转到用户账户编辑页面
     */

    @RequestMapping(value = "/edit")
    public String edit(Integer id,HttpServletRequest request){
        request.setAttribute("customer",customerService.getCustomer(id));
        return "system/customerupdate.jsp";
    }

    /**
     * 对用户信息进行修改
     */
    @ResponseBody
    @RequestMapping(value = "/editUpdate")
    public Map<String, Object> doUpdateAdmin(Customer customer) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", -1);//默认失败
        try {
            if(customerService.updateCustomer(customer)){
                map.put("status", 1);
                map.put("myMessage", "账户编辑成功");
            }else{
                map.put("myMessage", "账户编辑失败");
            }
        }catch (MyFormException e){
            map.put("myMessage", e.getMessage());
        }

        return map;
    }
    //删除用户
    //删除
    @ResponseBody
    @RequestMapping(value = "/delete")
    public  Map<String,Object> deleteCustomer(Integer id,HttpSession session){
        Map<String,Object> map=new HashMap<String,Object>();//定义一个map集合



            customerService.deleteCustomer(id);
            map.put("status", 1);

        return  map;
    }
}
