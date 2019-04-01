package dao;

import com.bjbls.forum.dao.SendCusDao;
import com.bjbls.forum.model.Customer;
import com.bjbls.forum.model.Send;
import com.bjbls.forum.model.SendCus;
import com.bjbls.forum.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

public class SendCusDaoTest extends SpringJunitTest{
    @Resource
    private SendCusDao sendCusDao;

    @Test
    public  void  AllTest(){
        List<SendCus> sendCuses=sendCusDao.ALL();
        for (SendCus sendCus:sendCuses){
            System.out.println(sendCus.getCustomer().getName());
        }

    }
    @Test
    public void  getTest(){
        List<SendCus> sendCuses=sendCusDao.get(8);
        for (SendCus sendCus:sendCuses){
            System.out.println(sendCus.getReply());
        }
    }
    @Test
    public void  add(){
        SendCus sendCus=new SendCus();
        sendCus.setCustomer(new Customer(13));
        sendCus.setSend(new Send(8));
        sendCus.setReply("可以可以");
        sendCusDao.add(sendCus);
    }
    @Test
    public void  del(){
        sendCusDao.del(11);
    }

}
