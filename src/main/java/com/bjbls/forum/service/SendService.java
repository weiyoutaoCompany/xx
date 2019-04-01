package com.bjbls.forum.service;

import com.bjbls.forum.dao.SendDao;
import com.bjbls.forum.model.Page;
import com.bjbls.forum.model.Send;

import com.bjbls.forum.model.exception.MyFormException;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class SendService {
    @Resource
    private SendDao sendDao;
    //查询所有属于1的帖子显示前台页面前四条
    public List<Send> getSend(){return sendDao.readAll();}
    //查询所有属于2的帖子显示后台页面，用于审核
    public  List<Send>  getSend2(){return  sendDao.readAll2();}
    //查询所有属于1的帖子显示后台页面，用于审核
    public  List<Send>  getSend3(){return  sendDao.readAll3();}
    ///查询所有属于用户的帖子显示前台
    public List<Send> getCus(Integer id){ return  sendDao.getCus(id);}
    //查询不同版块的帖子
    public List<Send> getBan(Integer id){return  sendDao.getBan(id);}
    //查询单个帖子
    public Send getSend(Integer id){
        Send send=null;
        if (id!=null) {
            send = sendDao.get(id);
        }
        return  send;

    }
    //更新用户信息
    public boolean updateSend(Send send) throws MyFormException {
        boolean status=false;
        if (send.getTheme()==""){
            throw  new MyFormException("添加失败：主题不能为空!");
        }
        if(send.getContent().equals("")){
            throw new MyFormException("添加失败：内容不能为空");
        }

        int i=sendDao.update(send);//更新了多少条记录
        // 编写代码，判断是否编辑成功
        if (i ==1) {
            status = true;
        }
        return status;
    }

    //删除帖子
    public  void  deleteSend(Integer id){sendDao.delete(id);}

    //添加帖子
    public  void add(Send send)throws MyFormException {
        if(send!=null){
            if(send.getTheme().equals("")){
                throw new MyFormException("添加失败：主题不能为空");
            }
            if(send.getContent().equals("")){
                throw new MyFormException("添加失败：内容不能为空");
            }

            if(send!=null){
                Date date=new Date();
                send.setTime(date);
                sendDao.add(send);
            }else{
                throw new MyFormException("添加失败：发帖失败");
            }
        }else{
            throw new MyFormException("添加失败：表单数据不能为空");
        }
    }
    //存入当前页和每页几条记录
    public List<Send> raadCus(Page page){return sendDao.readCus(page);}
}
