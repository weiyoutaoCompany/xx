package service;

import com.bjbls.forum.model.Customer;
import com.bjbls.forum.model.Send;
import com.bjbls.forum.model.SendCus;
import com.bjbls.forum.service.SendCusService;
import com.bjbls.forum.test.SpringJunitTest;
import org.junit.Test;
import org.omg.CORBA.PUBLIC_MEMBER;

import javax.annotation.Resource;

public class SendCusServiceTest extends SpringJunitTest{
    @Resource
    SendCusService sendCusService;
    @Test
    public void  get(){
        sendCusService.get(1);
    }
    @Test
    public void add(){
        SendCus sendCus=new SendCus();

        sendCus.setCustomer(new Customer(13));
        sendCus.setSend(new Send(8));
        sendCus.setReply("还行");
        sendCusService.add(sendCus);
    }
    @Test
    public void  delete(){
        sendCusService.delete(10);
    }
}
