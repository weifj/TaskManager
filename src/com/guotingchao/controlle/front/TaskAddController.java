package com.guotingchao.controlle.front;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.guotingchao.model.impl.T_user_task;
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
			//Task task = getModel(Task.class);
			T_user_task user_task = new T_user_task();
			Task task =new Task();//不能这样操作  进来的值全部都是字符串 你全部都用  getPara 去做
			task.set("taskMaker", getPara("task.taskMaker"));
			task.set("taskInfo", getPara("task.taskInfo"));
			task.set("rank", getParaToInt("task.rank"));
			task.set("taskName", getParaToInt("task.taskName"));
			SimpleDateFormat sdf = new  SimpleDateFormat( "yyyy-MM-dd" ); 
			Date play_time=sdf.parse(getPara("task.play_Time"));
			task.set("play_Time", play_time);
			String[] uid = getPara("user.id").split(",");
			if (task.save()) {
				Long id = task.getLong("id");
				for(int i=0;i<uid.length;i++){
					user_task.set("tid",id);
					user_task.set("uid",uid[i]);
					if(user_task.save()){
						setAttr("add_success_msg", "任务成功");
					}
				}
			}
		} catch (Exception e) {
			log.info( e.getMessage());
			setAttr("add_success_msg", "添加任务" + getPara("task.taskName")+ "失败,原因：" + e.getMessage());
		}
		redirect("/");
	}
}
