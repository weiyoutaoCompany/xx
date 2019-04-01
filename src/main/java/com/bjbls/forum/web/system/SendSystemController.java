package com.bjbls.forum.web.system;


import com.bjbls.forum.model.Customer;
import com.bjbls.forum.model.Page;
import com.bjbls.forum.model.Send;
import com.bjbls.forum.model.exception.MyFormException;
import com.bjbls.forum.service.*;
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
@RequestMapping(value = "/systemsend")
public class SendSystemController {
    @Resource
    private SendService sendService;
    @Resource
    private Send_TypeService send_typeService;
    @Resource
    private Send_StateService send_stateService;
    @Resource
    private PageService pageService;

    //跳转帖子审核列表页面

    @RequestMapping(value = "/list")
    public  String list(HttpServletRequest request){
       request.setAttribute("list",sendService.getSend2());

        return "system/sendmanage.jsp";
    }

    @RequestMapping(value = "/list2")
    public  String list2(HttpServletRequest request){
        request.setAttribute("list",sendService.getSend3());


        return "system/sendmanagelist.jsp";
    }
    /**
     * 跳转到帖子审核编辑页面
     */

    @RequestMapping(value = "/edit")
    public String edit(Integer id,HttpServletRequest request){
        request.setAttribute("type",send_typeService.getSend_Type());
        request.setAttribute("state",send_stateService.getSend_State());
        request.setAttribute("send",sendService.getSend(id));
        return "system/sendupdate.jsp";
    }
    /**
     * 跳转到帖子审核编辑页面
     */

    @RequestMapping(value = "/edit2")
    public String edit2(Integer id,HttpServletRequest request){
        request.setAttribute("type",send_typeService.getSend_Type());
        request.setAttribute("state",send_stateService.getSend_State());
        request.setAttribute("send",sendService.getSend(id));
        return "system/sendupdatelist.jsp";
    }
    /**
     * 对帖子信息进行修改
     */
    @ResponseBody
    @RequestMapping(value = "/editUpdate")
    public Map<String, Object> doUpdateSend(Send send) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", -1);//默认失败
        try {
            if(sendService.updateSend(send)){
                map.put("status", 1);
                map.put("myMessage", "帖子编辑成功");
            }else{
                map.put("myMessage", "帖子编辑失败");
            }
        }catch (MyFormException e){
            map.put("myMessage", e.getMessage());
        }

        return map;
    }
    // //删除用户
    //删除
    @ResponseBody
    @RequestMapping(value = "/delete")
    public  Map<String,Object> deleteCustomer(Integer id,HttpSession session){
        Map<String,Object> map=new HashMap<String,Object>();//定义一个map集合


        sendService.deleteSend(id);
       // customerService.deleteCustomer(id);
        map.put("status", 1);

        return  map;
    }
}
