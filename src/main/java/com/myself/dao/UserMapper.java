package com.myself.dao;

import java.util.List;

import com.myself.model.User;
import com.myself.query.UserQuery;

public interface UserMapper {
	
	List<User> findAll(); 
	
	int insert(User user);
	
	int update(User user);
	
	void delete(long id);
	
	List<UserQuery> searchPage(UserQuery cond);

	long contBySearch(UserQuery cond);
	
}
