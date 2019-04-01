package service;

import com.bjbls.forum.service.Send_StateService;
import com.bjbls.forum.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

public class Send_StateServiceTest extends SpringJunitTest {
    @Resource
    private Send_StateService send_stateService;
    @Test
    public  void readsend_Stateall(){
        send_stateService.getSend_State();
        System.out.println(send_stateService.getSend_State());
    }
}
