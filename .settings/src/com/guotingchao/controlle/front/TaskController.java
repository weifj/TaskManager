package com.guotingchao.controlle.front;

import com.guotingchao.model.impl.Task;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;


public class TaskController extends Controller{
	Logger log = Log4jLogger.getLogger(TaskController.class);
	
	public void index(){
		long tid = getParaToLong("tid");
		log.info("id:"+tid);
		renderJson(Task.taskDao.findTaskById(tid));
	}
}
