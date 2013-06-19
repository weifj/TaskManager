package com.guotingchao.controlle.front;

import com.jfinal.core.Controller;

/**
 * 前端Index控制器
 * @author os-yugq
 *
 */
public class ShowController extends Controller{
	
	/**
	 * 任务详细页
	 */
	public void index(){
		render("../show.jsp");
	}
}
