package com.guotingchao.controlle.front;

import com.guotingchao.model.impl.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;


public class ValidateController extends Controller{
	Logger log = Log4jLogger.getLogger(ValidateController.class);
	
	public void index(){
		String uname = getPara("uname");
		String upass = getPara("upass");
		log.info("uname:"+uname+"   "+"upass:"+upass);
		User user = User.userDao.findFirst("select * from user where user.uname=? and user.upass= ? ",uname,upass);
		Boolean flag;
		if(user!=null){
			flag=true;
			user.put("upass", null);
			setSessionAttr("user_info", user);
		}else{
			flag=false;
		}
		renderJson(flag);
	}
}
