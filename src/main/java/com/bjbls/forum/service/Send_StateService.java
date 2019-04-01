package com.bjbls.forum.service;

import com.bjbls.forum.dao.Send_StateDao;
import com.bjbls.forum.model.SendState;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Send_StateService {
    @Resource
    private Send_StateDao send_stateDao;

    public SendState getSendStateid(Integer id){
        SendState send_state=null;
        send_state=send_stateDao.get(id);
        return  send_state;
    }
    public List<SendState> getSend_State(){return  send_stateDao.readAll();}
}
