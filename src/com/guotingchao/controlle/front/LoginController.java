package com.guotingchao.controlle.front;

import com.guotingchao.model.impl.Task;
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
	
}
