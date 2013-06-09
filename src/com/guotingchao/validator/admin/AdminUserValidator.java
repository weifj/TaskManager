package com.guotingchao.validator.admin;

import com.guotingchao.model.impl.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.validate.Validator;

public class AdminUserValidator extends Validator {
	Logger log = Log4jLogger.getLogger(AdminUserValidator.class);
	

	@Override
	protected void validate(Controller c) {
		validateRequired("user.uname", "uname_msg", "请输入用户名");
		validateRequired("user.upass", "upass_msg", "请输入密码");
		validateEqualField("upass_valid","user.upass", "upass_valid_msg", "确认密码不一致 请重新输入");
	}
	 
	@Override
	protected void handleError(Controller c) {
		c.keepModel(User.class);
		String actionKey = getActionKey();
		log.info(actionKey);
		if(actionKey.equals("/admin/add")){
			c.render("addUser.jsp");
		}
	}

}
