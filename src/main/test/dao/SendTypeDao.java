package dao;

import com.bjbls.forum.dao.Send_TypeDao;
import com.bjbls.forum.model.SendType;
import com.bjbls.forum.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

public class SendTypeDao extends SpringJunitTest {
    @Resource
    Send_TypeDao sendTypeDao;
    @Test
    public  void get(){
        SendType send_type=null;
        send_type=sendTypeDao.get(1);
        System.out.println(send_type.getName());
        System.out.println(send_type.getContent());
    }
}
