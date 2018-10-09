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
    /*
    注册方法
    @param username  账户名
    @param password  密码
     @return
  */
    public  boolean add(Customer customer) {
        customerDao.add(customer);
        if (customer != null) {
            return true;
        } else {
            return false;
        }
    }
     /*
    更新密码方法
    @param username  账户名
    @param password  密码
     @return
  */
    public  boolean updatePassword(String password,Integer id){
        customerDao.updatePassword(password,id);
        if (password != null) {
            return true;
        } else {
            return false;
        }

    }

    /*
  检测username是否重名方法
  @param username  账户名
  @param password  密码
   @return
*/
    public  boolean addcs(String username){
        customerDao.addcs(username);
        if (username!=null) {
            return true;
        } else {

            return false;
        }

    }

}
