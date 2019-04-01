package com.bjbls.forum.web.send;

import com.bjbls.forum.dao.SendCusDao;
import com.bjbls.forum.model.Send;
import com.bjbls.forum.model.SendCus;
import com.bjbls.forum.model.exception.MyFormException;
import com.bjbls.forum.service.*;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/send")
public class SendController {
    @Resource
    SendService sendService;
    @Resource
    SendCusService sendCusService;
    @Resource
    Send_TypeService send_typeService;
    @Resource
    Send_StateService send_stateService;
    @Resource
    CustomerService customerService;
    //跳转列表页面

    @RequestMapping(value = "/index")
    public String send(HttpServletRequest request){
        request.setAttribute("send",sendService.getSend());
        request.setAttribute("type",send_typeService.getSend_Type());
        return "send/send.jsp";
    }
    @RequestMapping(value = "/sendpost")
    public  String sendpost(Integer id,HttpServletRequest request){
    request.setAttribute("cus",sendCusService.get(id));
    request.setAttribute("sendpost",sendService.getSend(id));
        return  "send/sendpost.jsp";
    }
    //添加回复
    @ResponseBody
    @RequestMapping(value = "/add")
    public Map<String,Object> add(SendCus sendCus) {
        Map<String, Object> map=new HashMap<String, Object>();
        try {
            sendCusService.add(sendCus);
            map.put("status", 1);
            map.put("myMessage", "回复成功");
        } catch (MyFormException e) {
            map.put("status", -1);
            map.put("myMessage", e.getMessage());
        }
        return map;
    }
    //发布新帖子
    @RequestMapping(value = "/mypostnew")
    public  String mypostnew(HttpServletRequest request){
        request.setAttribute("type",send_typeService.getSend_Type());
        return  "customer/mypostnew.jsp";
    }
    //添加新帖
    @ResponseBody
    @RequestMapping(value = "/addSend")
    public  Map<String,Object>  add(Send send) {
        Map<String, Object> map=new HashMap<String, Object>();
        try {
           sendService.add(send);
            map.put("status", 1);
            map.put("myMessage", "已提交，等待管理员审核!");
        } catch (MyFormException e) {
            map.put("status", -1);
            map.put("myMessage", e.getMessage());
        }
        return map;
    }
    //我的帖子
    @RequestMapping(value = "/mypost")
    public  String mypPost(Integer id,HttpServletRequest request){

        request.setAttribute("mySend",sendService.getCus(id));
        return  "customer/mypost.jsp";
    }
    //查询单个帖子
    @RequestMapping(value = "/edit")
    public String edit(Integer id,HttpServletRequest request){
        request.setAttribute("type",send_typeService.getSend_Type());
        request.setAttribute("state",send_stateService.getSend_State());
        request.setAttribute("send",sendService.getSend(id));
        return "send/sendupdate.jsp";
    }
    //对帖子信息进行修改
    @ResponseBody
    @RequestMapping(value = "/editUpdate")
    public Map<String, Object> doUpdateSend(Send send,HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", -1);//默认失败
        try {
            if(sendService.updateSend(send)){
                map.put("status", 1);
                map.put("myMessage", "编辑成功");

            }else{
                map.put("myMessage", "编辑失败");
            }
        }catch (MyFormException e){
            map.put("myMessage", e.getMessage());
        }

        return map;
    }
    //
    //我的帖子
    @RequestMapping(value = "/bankuai")
    public  String bankuai(Integer id,HttpServletRequest request){


            request.setAttribute("ban", sendService.getBan(id));
        return  "send/bankuai.jsp";
    }
    //删除回复
    @ResponseBody
    @RequestMapping(value = "/delete")
    public  Map<String,Object> delete(Integer id,HttpSession session){
        Map<String,Object> map=new HashMap<String,Object>();//定义一个map集合



        sendCusService.delete(id);
        map.put("status", 1);
        map.put("myMessage", "删除成功");


        return  map;
    }
}
