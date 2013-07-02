package com.guotingchao.controlle.front;

import com.guotingchao.validator.front.LoginValidate;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * 前端Index控制器
 * @author os-yugq
 *
 */
public class LoginController extends Controller{
	
	
	/**
	 *  主页
	 */
	public void index(){
		render("../login.jsp");
	}
	
	/**
	 * 登录动作处理
	 */
	@Before(LoginValidate.class)
	public void doLogin() {
		
	}
}
