package com.myself.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.myself.model.User;
import com.myself.query.UserQuery;
import com.myself.service.UserService;
import com.myself.util.PageView;

@Controller 
public class UserController {
	private static final Logger LOGGER = Logger.getLogger(UserController.class);  
	
	@Autowired  
    private UserService userService; 
	
	/** 查询 */
    @RequestMapping(value="/test", method = RequestMethod.GET)
    @ResponseBody
    public void testQuery() {  
    	try {
    		  List<User> user = userService.findAll();  
    	      LOGGER.info(JSON.toJSON(user));  
		} catch (Exception e) {
			e.printStackTrace();
		}
    } 
    
    /** 增加 */
    @RequestMapping(value="/insert", method = RequestMethod.POST)
    public String insert(@RequestBody User user) {  
    	try {
    		userService.insert(user); 
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "01";
    } 
    /** 修改 */
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String update(@RequestBody User user) {  
    	try {
    		userService.update(user); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "01";
    } 
    /** 删除 */
    @RequestMapping(value="/delete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(long id) {  
    	try {
    		userService.delete(id);  
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "01";
    } 
    
    /** 分页 */
    @RequestMapping(value="/queryPage", method = RequestMethod.POST)
    @ResponseBody
    public PageView queryPage(@RequestBody UserQuery cond) {
    	/*创建对象*/
    	PageView page = new PageView();
    	cond.init();
    	try {
    		/*查询分页，返回list集合*/
    		List<UserQuery> list = userService.searchPage(cond);
    		/*查询总数，返回long*/
    		long count =userService.contBySearch(cond);
    		page.setCode("01");
    		page.setTotal(count,cond.getSize());;
    		page.setResp(list);
		} catch (Exception e) {
			page.setCode("00");
			page.setMsg("error");
			e.printStackTrace();
		}
		return page;
    } 
}
