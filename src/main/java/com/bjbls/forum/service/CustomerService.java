package com.bjbls.forum.service;

import com.bjbls.forum.dao.CustomerDao;
import com.bjbls.forum.model.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CustomerService {
    @Resource
    private CustomerDao customerDao;

    /*
   登录方法
   @param username  账户名
   @param password  密码
   @return true表示登录成功，false表示登录失败
    */
    public boolean login(String username,String password){
        Customer customer=customerDao.login(username, password);
        if(customer!=null){
            return true;
        }else{
            return false;
        }
    }
}
