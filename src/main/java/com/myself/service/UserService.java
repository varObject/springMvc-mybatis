package com.myself.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myself.model.User;
import com.myself.query.UserQuery;

@Service  
public interface UserService  {
	
	List<User> findAll(); 
	
	int insert(User user);
	
	int update(User user);
	
	void delete(long id);
	
	List<UserQuery> searchPage(UserQuery cond);

	long contBySearch(UserQuery cond);
}
