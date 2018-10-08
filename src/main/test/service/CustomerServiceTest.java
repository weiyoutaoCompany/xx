package service;

import com.bjbls.forum.service.CustomerService;
import com.bjbls.forum.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

public class CustomerServiceTest extends SpringJunitTest{
@Resource
    private CustomerService customerService;

@Test
public void loginTest(){
    System.out.println(customerService.login("admin","123"));
    System.out.println(customerService.login("a","123456"));

}

}
