package com.guotingchao.controlle.front;

import com.guotingchao.model.impl.Task;
import com.guotingchao.model.impl.User;
import com.guotingchao.validator.front.AddTaskValidate;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;


public class TaskAddController extends Controller{
	public Logger log = Log4jLogger.getLogger(TaskAddController.class);
	public void index(){
		setAttr("userList",User.userDao.findUserList());
		render("../addTask.jsp");
	}
	@Before(AddTaskValidate.class)
	public void doAdd(){
		try {
			Task task =getModel(Task.class);
			if (task.save()) {
				Long id = task.getLong("id");
				setAttr("add_success_msg", "任务成功");
			}
		} catch (Exception e) {
			setAttr("add_success_msg", "添加任务" + getPara("task.taskName")+ "失败,原因：" + e.getMessage());
		}
		redirect("/");
	}
}
