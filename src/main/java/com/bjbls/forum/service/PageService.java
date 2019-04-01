package com.bjbls.forum.service;

import com.bjbls.forum.dao.PageDao;
import com.bjbls.forum.model.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PageService {
    @Resource
    private PageDao pageDao;

    public Page afferentPage(Page page){
        //总记录数的赋值 adminBean.tatolCount()方法赋值
        if(page.getTableName()!=null){
            page.setTatolCount(pageDao.tatolCount(page));
        }
        //总页数的赋值 计算
        page.setPageCount( (page.getTatolCount() + page.getPageSize() - 1) / page.getPageSize() );
        //当前页的判断 计算 （输入数据库的pageIndex）
        if (page.getPageIndex() <= 1) {
            page.setPageIndex(0);
        } else if (page.getPageIndex() > page.getPageCount()) {
            page.setPageIndex( (page.getPageCount() - 1 ) * page.getPageSize() );
        } else {
            page.setPageIndex( (page.getPageIndex() - 1 ) * page.getPageSize() );
        }
        return page;
    }
    public Page outPage(Page page){
        //当前页的计算 （输出前台的pageIndex）
        page.setPageIndex( page.getPageIndex() / page.getPageSize() + 1 );
        return page;
    }
}
