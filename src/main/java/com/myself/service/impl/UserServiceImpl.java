package com.myself.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myself.dao.UserMapper;
import com.myself.model.User;
import com.myself.query.UserQuery;
import com.myself.service.UserService;
import com.myself.util.PageCondition;
import com.myself.util.PageView;

@Service  
public class UserServiceImpl implements UserService {

	@Autowired  
	private UserMapper userMapper; 
	  
	public List<User> findAll() {
		return userMapper.findAll();
	}
	
	public int insert(User user) {
		return userMapper.insert(user);
	}

	public int update(User user) {
		return userMapper.update(user);
	}

	public void delete(long id) {
		userMapper.delete(id);
		
	}
	
	/*分页*/
	public List<UserQuery> searchPage(UserQuery cond) {
		return userMapper.searchPage(cond);
	}
	
	/*总数*/
	public long contBySearch(UserQuery cond) {
		return userMapper.contBySearch(cond);
	}


}
