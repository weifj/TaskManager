package com.guotingchao.interceptor;

import com.guotingchao.model.impl.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

/**
 * admin 路径 基础拦截器
 * 
 * @author os-guozc
 * 
 */
public class IndexInterceptor implements Interceptor {
	Logger log = Log4jLogger.getLogger(IndexInterceptor.class);

	@Override
	public void intercept(ActionInvocation ai) {
		Controller c= ai.getController();
			User user =c.getSessionAttr("user_info");
			log.info("\naction Key: "+ai.getActionKey()
					+"\nmethod Key: "+ai.getMethodName()
					+"\npath Key: "+ai.getViewPath());
			if (user != null && !"".equals(user.getStr("uname"))) {
				ai.invoke();
			}else{
				c.redirect("/admin/login");
			}
	}
}
