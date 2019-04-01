package com.bjbls.forum.service;

import com.bjbls.forum.dao.Send_TypeDao;
import com.bjbls.forum.model.SendType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Send_TypeService {
    @Resource
    private Send_TypeDao sendTypeDao;


    public SendType getSendType(Integer id){
        SendType send_type=null;
            send_type=sendTypeDao.get(id);
        return send_type;
    }
    public List<SendType> getSend_Type(){return sendTypeDao.readAll();}
}
