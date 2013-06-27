package com.guotingchao.controlle.front;

import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;


public class TaskAddController extends Controller{
	Logger log = Log4jLogger.getLogger(TaskController.class);
	
	public void index(){
			render("../addTask.jsp");
	}

}
