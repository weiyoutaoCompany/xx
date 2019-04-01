package dao;

import com.bjbls.forum.dao.AdminDao;
import com.bjbls.forum.model.Admin;
import com.bjbls.forum.model.Page;
import com.bjbls.forum.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

public class AdminDaoTest extends SpringJunitTest {
    @Resource
    private AdminDao adminDao;


    @Test
    public void readCus(){
        Page page=new Page();
        String admin=null;
        page.setTableName(admin);
        page.setPageIndex(0);
        page.setPageSize(2);
        List<Admin> admins=adminDao.readCus(page);
        System.out.println(adminDao.readCus(page));
        //存入当前页和每页几条记录查看
        for (Admin admins1:admins) {
            System.out.println(admins1.getUsername());
        }
    }
}
