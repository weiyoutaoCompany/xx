package com.bjbls.forum.service;

import com.bjbls.forum.dao.CustomerDao;
import com.bjbls.forum.model.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

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
    public boolean login(String username, String password){
        Customer customer=customerDao.login(username, password);
        if(customer!=null){

            return true;
        }else{
            return false;
        }
    }
    /*
  登录获取
  @param username  账户名
  @param password  密码
  @return true表示登录成功，false表示登录失败
   */
    public  Customer login1(String username,String password){
        Customer customer=customerDao.login(username, password);
        return customer;
    }
    /*
    注册方法
    @param username  账户名
    @param password  密码
     @return
  */
    public  boolean add(Customer customer) {
      //  customerDao.add(customer);
        //先判断customer不为空，再把用户名传进去如果不为0，说明有相同的用户名存在,当通过后在进行注册
        if (customer != null) {
        if (customerDao.addCs(customer.getUsername())==0){

            customerDao.add(customer);
            return  true;
        }
            return false;
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
    customer列表方法
     @param username  账户名
     @param password  密码
      @return
   */
    public List<Customer> getCustomer(){
        return  customerDao.readAll();
    }
      /*
    customer删除方法
   */
    public  void  deleteCustomer(Integer id){customerDao.delete(id);}
      /*
    customer查询单条记录
   */
    public  Customer getCustomer(Integer id){
        Customer customer=null;
        if (id!=null){
            customer=customerDao.get(id);
        }
        return customer;
    }

}
