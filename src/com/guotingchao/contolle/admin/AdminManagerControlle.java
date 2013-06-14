package com.guotingchao.contolle.admin;

import com.guotingchao.interceptor.IndexInterceptor;
import com.guotingchao.model.impl.User;
import com.guotingchao.validator.admin.AdminUserValidator;
import com.guotingchao.validator.admin.LoginValidator;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

/**
 * @author os-guozc
 */
@Before(IndexInterceptor.class)
public class AdminManagerControlle extends Controller {
	Logger log = Log4jLogger.getLogger(AdminManagerControlle.class);

	/**
	 * 用户管理首页
	 */
	public void index() {
		setAttr("userList", User.userDao.findUserList());
	}

	/**
	 * 添加用户
	 */
	@Before(AdminUserValidator.class)
	public void add() {
		try {
			boolean result = getModel(User.class).save();
			if (result) {
				setAttr("add_success_msg", "恭喜添加用户" + getPara("user.uname")+ "成功,现在就可以登录");
			}
		} catch (Exception e) {
			setAttr("add_success_msg", "添加用户" + getPara("user.uname")+ "失败,原因：" + e.getMessage());
		}
			render("addUser.jsp");
	}

	/**
	 * 登录
	 */
	@ClearInterceptor(ClearLayer.ALL)
	@Before(LoginValidator.class)
	public void dologin(){
		log.info("登录");
	}

	@ClearInterceptor(ClearLayer.ALL)
	public void login() {
		User user =getSessionAttr("user_info");
		if(user!=null){
			render("/admin");
		}else
			render("login.jsp");
	}
	/**
	 *  添加用户页
	 */
	public void addUser(){
		render("addUser.jsp");
	}

}
