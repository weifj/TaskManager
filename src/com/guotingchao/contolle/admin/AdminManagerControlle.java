package com.guotingchao.contolle.admin;

import com.guotingchao.model.impl.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

/**
 * 
 * @author os-guozc
 * 
 */
public class AdminManagerControlle extends Controller {
	Logger log = Log4jLogger.getLogger(AdminManagerControlle.class);
	
	/**
	 *   用户管理首页
	 */
	public void index() {
		setAttr("userList",User.userDao.findUserList());
	}
	/**
	 *   添加用户
	 */
	public void add() {
		
	}
	
	/**
	 *  删除用户
	 */
	public void delete() {

	}

	/**
	 * 	更新用户信息
	 */
	public void update() {

	}

	/**
	 *  查询用户
	 */
	public void find() {

	}
	/**
	 * ================================
	 * View 层转发
	 */
	public void addUser(){
		render("addUser.jsp");
	}
}
