package com.guotingchao.controlle.front;

import com.guotingchao.model.impl.Task;
import com.jfinal.core.Controller;

/**
 * 前端Index控制器
 * @author os-yugq
 *
 */
public class IndexController extends Controller{
	
	
	/**
	 *  主页
	 */
	public void index(){
		setAttr("taskListInit", Task.taskDao.findTaskListByType(0));
		setAttr("taskListOn", Task.taskDao.findTaskListByType(1));
		setAttr("taskListOver", Task.taskDao.findTaskListByType(2));
		setAttr("taskListClose", Task.taskDao.findTaskListByType(-1));
		render("index.jsp");
	}
	
}
