package com.guotingchao.validator.admin;

import com.guotingchao.model.impl.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.validate.Validator;

public class LoginValidator extends Validator {
	Logger log = Log4jLogger.getLogger(LoginValidator.class);

	@Override
	protected void handleError(Controller c) {
		c.keepModel(User.class);
		String actionKey = getActionKey();
		log.info(actionKey);
		c.render("login.jsp");
	}

	@Override
	protected void validate(Controller c) {
		if(c.getSessionAttr("user_info")!=null){ //如果已经登录过
			//c.forwardAction("/admin");
		}
		validateRequired("user.uname", "uname_msg", "请输入用户名");
		validateRequired("user.upass", "upass_msg", "请输入密码");
		String uname = c.getPara("user.uname");
		String upass = c.getPara("user.upass");
		User user = User.userDao.findFirst("select * from user where user.uname=? and user.upass= ? ",uname,upass);
		if(user!=null){
			user.put("upass", null);
			c.setSessionAttr("user_info", user);
			c.redirect("/admin");
		}else{
			c.setAttr("login_error", "账户或密码错误");
			handleError(c);
		}
	}
}
