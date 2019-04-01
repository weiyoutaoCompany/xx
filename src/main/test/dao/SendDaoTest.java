package dao;

import com.bjbls.forum.dao.SendDao;
import com.bjbls.forum.model.*;
import com.bjbls.forum.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

public class SendDaoTest extends SpringJunitTest {
    @Resource
    private SendDao sendDao;
    /*
查询第几条记录
 */
    @Test
    public void readAllTest(){
       List<Send> sends=sendDao.readAll();
       for(Send send:sends){
           System.out.println(send.getId());
           System.out.println(send.getCustomer().getName());
           System.out.println(send.getSendType().getName());
           System.out.println(send.getSendState().getName());
     //      System.out.println(send.getCustomer().getName());
       }
    }
    @Test
    public void readAll0Test(){
        List<Send> sends=sendDao.readAll();
        for (Send send:sends){

            System.out.println(send.getId());
            System.out.println(send.getCustomer().getName());
            System.out.println(send.getSendType().getName());
            System.out.println(send.getTheme());
            System.out.println(send.getSendState().getName());
            System.out.println(send.getSendType().getId());

        }


    }
    @Test
    public void updateTest(){
        Send send=sendDao.get(9);
        System.out.println( send.getId());
        System.out.println(send.getSendType().getName());
        System.out.println(send.getSendState().getName());
        System.out.println(send.getCustomer().getId());
        System.out.println(send.getTheme());
        System.out.println(send.getContent());

        send.setSendType(new SendType(1));
        send.setSendState(new SendState(2));
        send.setCustomer(new Customer(13));
        send.setTheme("aaa");
        send.setContent("bbb");
        send.setId(send.getId());
        sendDao.update(send);

        //sendDao.update(send);

    }
    @Test
    public void readAll3Test(){
        List<Send> send=sendDao.readAll3();

        System.out.println(sendDao.readAll3());
        for (Send sends:send){
            System.out.println(sends.getSendState().getName());
        }

    }
    @Test
    public void getTest(){
         Send send=sendDao.get(8);
        System.out.println(send.getTime());
    }
    @Test
    public void addTest(){
        Date date=new Date();
        Send send=new Send();
        send.setId(null);
        send.setContent("测试测试测试");
        send.setTheme("测试");
        send.setCustomer(new Customer(1));
        send.setSendState(new SendState(2));
        send.setSendType(new SendType(2));
         send.setTime(date);
        sendDao.add(send);
        System.out.println(send.getTime());
    }
    @Test
    public void  getCusTest(){
        List<Send> sends=sendDao.getCus(1);
        for (Send send:sends){
            System.out.println(send.getTheme());
        }

    }
    @Test
    public void  getBan(){
        List<Send> sends=sendDao.getBan(1);
        for (Send send:sends){
            System.out.println(send.getTheme());
        }
    }

    @Test
    public void readCus(){
        Page page=new Page();
        String send=null;
        page.setTableName(send);
        page.setPageIndex(0);
        page.setPageSize(2);
        List<Send> sends=sendDao.readCus(page);
        System.out.println(sendDao.readCus(page));
        //存入当前页和每页几条记录查看
        for (Send send1:sends) {
            System.out.println(send1.getTheme());
        }
    }
}
