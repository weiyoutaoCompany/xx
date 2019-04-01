package com.bjbls.forum.web.system;


import com.bjbls.forum.model.Admin;
import com.bjbls.forum.model.Page;
import com.bjbls.forum.model.exception.MyFormException;
import com.bjbls.forum.service.AdminService;
import com.bjbls.forum.service.PageService;
import org.springframework.stereotype.Controller;
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
@RequestMapping(value = "/system")
public class AdminController {
    @Resource
    private AdminService adminService;
    @Resource
    private PageService pageService;
    //跳转首页

    @RequestMapping(value = "/index")
    public  String index(HttpSession session){
        if (session.getAttribute("admin")==null){
            return "system/login.jsp";
        }else {
            return "system/index.jsp";
        }
    }
  /*  @RequestMapping(value = "/")
    public  String index2(HttpSession session){
        if (session.getAttribute("admin")==null){
            return "system/login.jsp";
        }else {
            return "system/index.jsp";
        }
    }*/
    //跳转管理员添加

    @RequestMapping(value = "/signup")
    public  String signup(){
        return "system/adminadd.jsp";
    }

    /*
      if (session.getAttribute("admin")==null){
            return "system/login.jsp";
        }else {
            return "system/index.jsp";
        }
    * 跳转到后台登录,成功前台返回index
    */
    @ResponseBody
    @RequestMapping(value = "/login")
    public Map<String,Integer> login(String username, String password, HttpSession session){
        Map<String,Integer> map=new HashMap<String,Integer>();//定义一个map集合

        if(adminService.login(username, password)){
            //将登录的用户数据传完前台
            Admin admin=adminService.login1(username, password);
            session.setAttribute("admin",admin);
            map.put("status", 1);

        }else{
            map.put("status", -1);
        }
        return  map;

    }
    //删除session

    @RequestMapping(value = "/exit")
    public  String deleteid(HttpSession session){
        session.removeAttribute("admin");
        return "system/login.jsp";
}
    //跳转列表页面

    @RequestMapping(value = "/list")
    public  String list(HttpServletRequest request, Page page){
       // request.setAttribute("list",adminService.getAdmin());
        request.setAttribute("listAll",adminService.getAdmin());
        List<Admin> admins=new ArrayList<>();
        //存入查询哪一个表
        page.setTableName("admin");
        //根据传进来的当前页进行加减然后读取数据库的对应内容,存入session，前台显示
        admins=adminService.raadCus(pageService.afferentPage(page));
        request.setAttribute("page",pageService.outPage(page));
        request.setAttribute("list",admins);

        return "system/adminmanage.jsp";
    }
    //添加管理员
    @ResponseBody
    @RequestMapping(value = "/add")
    public  Map<String,Object>  add(Admin admin) {
        Map<String, Object> map=new HashMap<String, Object>();
        try {
            adminService.add(admin);
            map.put("status", 1);
            map.put("myMessage", "账户添加成功");
        } catch (MyFormException e) {
            map.put("status", -1);
            map.put("myMessage", e.getMessage());
        }
        return map;
    }

    //删除管理员
    //删除
    @ResponseBody
    @RequestMapping(value = "/delete")
    public  Map<String,Object> deleteCustomer(Integer id,HttpSession session){
        Map<String,Object> map=new HashMap<String,Object>();//定义一个map集合

        Admin admin=(Admin)session.getAttribute("admin");
        if (admin.getId()==id.intValue()){
            map.put("status", -1);
            map.put("myMessage","删除失败：不允许删除自己");

        }else {
            adminService.deleteAdmin(id);
            map.put("status", 1);
        }
        return  map;
    }
    /**
     * 跳转到账户编辑页面
     */

    @RequestMapping(value = "/edit")
    public String edit(Integer id,HttpServletRequest request){
        request.setAttribute("admin",adminService.getAdmin(id));
        return "system/adminupdate.jsp";
    }
    /**
     * 进行修改
     */
    @ResponseBody
    @RequestMapping(value = "/editUpdate")
    public Map<String, Object> doUpdateAdmin(Admin admin) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", -1);//默认失败
        try {
            if(adminService.updateAdmin(admin)){
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


}
