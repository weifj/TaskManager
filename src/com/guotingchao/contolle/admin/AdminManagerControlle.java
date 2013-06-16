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
	/***
	 *  退出登录
	 */
	public void loginOut(){
		removeSessionAttr("user_info");
		redirect("/admin/login");
	}
	/**
	 *   个人信息
	 *   #TODO 
	 *     1.管理角色 ok
	 *     2.任务相关信息  no 
	 *     3.用户基本信息 包括 ok
	 *       可修改 用户信息     ok
	 */
	public void userInfo(){	
		setAttr("roleInfo", User.userDao.findUser(getParaToLong("uid")));
		render("roleInfo.jsp");
	}
	
	/**
	 *  用户信息更新
	 */
	@Before(AdminUserValidator.class)
	public void update(){
		try {
			boolean result = getModel(User.class).update();
			if (result) {
				setAttr("add_success_msg", "更新用户信息成功");
			}
		} catch (Exception e) {
				setAttr("add_success_msg", "更新用户信息失败 ! 原因：" + e.getMessage());
		}
				render("releInfo.jsp");
	}

}
