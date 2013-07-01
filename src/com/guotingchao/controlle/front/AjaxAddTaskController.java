package com.guotingchao.controlle.front;

import com.guotingchao.model.impl.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;


public class AjaxAddTaskController extends Controller{
	Logger log = Log4jLogger.getLogger(AjaxAddTaskController.class);
	
	public void index(){
		String taskMaker = getPara("taskMaker");
		String taskname = getPara("taskname");
		String taskInfo = getPara("taskInfo");
		String paly_Time = getPara("paly_Time");
		String username = getPara("username");
		
	}
}
