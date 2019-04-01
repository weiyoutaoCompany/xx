package service;

import com.bjbls.forum.model.Send;
import com.bjbls.forum.service.SendService;
import com.bjbls.forum.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

public class SendServiceTest extends SpringJunitTest {
    @Resource
    private SendService sendService;

@Test
    public void updateService(){
    Send send=sendService.getSend(9);
    System.out.println(send.getTheme());
    send.setTheme("cccc");
    send.setContent("bbbb");


    sendService.updateSend(send);

    }
}
