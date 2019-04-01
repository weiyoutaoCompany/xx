package com.bjbls.forum.service;

import com.bjbls.forum.dao.SendCusDao;
import com.bjbls.forum.model.SendCus;
import com.bjbls.forum.model.exception.MyFormException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class SendCusService {
    @Resource
    SendCusDao sendCusDao;
    //查询帖子下面的所有回复
    public List<SendCus> get(Integer id){

    return sendCusDao.get(id);

    }
    //
    public  void add(SendCus sendCus)throws MyFormException {
        if(sendCus!=null){
            if(sendCus.getReply().equals("")){
                throw new MyFormException("添加失败：内容不能为空");
            }

            if(sendCus!=null){

              sendCusDao.add(sendCus);
            }else{
                throw new MyFormException("添加失败：回复失败");
            }
        }else{
            throw new MyFormException("添加失败：表单数据不能为空");
        }
    }
    public void delete(Integer id)throws MyFormException {

        if (id!=null) {
            sendCusDao.del(id);
        }else {
            throw new MyFormException("添加失败：表单数据不能为空");
        }
    }
}
