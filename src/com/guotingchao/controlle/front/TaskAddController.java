package com.guotingchao.controlle.front;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.guotingchao.model.impl.T_user_task;
import com.guotingchao.model.impl.Task;
import com.guotingchao.model.impl.User;
import com.guotingchao.validator.front.AddTaskValidate;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Model;


public class TaskAddController extends Controller{
	public Logger log = Log4jLogger.getLogger(TaskAddController.class);
	public void index(){
		setAttr("userList",User.userDao.findUserList());
		render("../addTask.jsp");
	}
	@Before(AddTaskValidate.class)
	public void doAdd(){
		try {
			//T_user_Task task = getModel(Task.class);
			Task task =new Task();//不能这样操作  进来的值全部都是字符串 你全部都用  getPara 去做
			task.set("taskMaker", getPara("task.taskMaker"));
			task.set("taskInfo", getPara("task.taskInfo"));
			task.set("rank", getParaToInt("task.rank"));
			task.set("taskName", getPara("task.taskName"));
			SimpleDateFormat sdf = new  SimpleDateFormat( "yyyy-MM-dd" ); 
			Date play_time=sdf.parse(getPara("task.play_Time"));
			task.set("play_Time", play_time); 
			String[] uid = getPara("user.id").split(",");
			List<Model> user_task_list = new ArrayList<Model>();
			if (task.save()) {
				String tid = task.get("id").toString();
				for(int i=0;i<uid.length;i++){
					T_user_task temp_user_task = new T_user_task();
					temp_user_task.set("tid",tid);
					temp_user_task.set("uid",uid[i]);
					user_task_list.add(temp_user_task);
				}
				T_user_task.taskUserDao.batchSave(user_task_list);
			}
		} catch (Exception e) {
			log.error( e.getMessage());
			setAttr("add_success_msg", "添加任务" + getPara("task.taskName")+ "失败,原因：" + e.getMessage());
		}
		redirect("/");
	}
}
