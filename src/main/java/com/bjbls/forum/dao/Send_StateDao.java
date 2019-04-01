package com.bjbls.forum.dao;


import com.bjbls.forum.model.SendState;

import java.util.List;

public interface Send_StateDao {

    SendState get(int id);

    List<SendState> readAll();

}
