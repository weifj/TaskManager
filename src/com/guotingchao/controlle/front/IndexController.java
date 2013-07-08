package com.guotingchao.controlle.front;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.guotingchao.interceptor.ForntUrlInterceptor;
import com.guotingchao.model.impl.T_user_task;
import com.guotingchao.model.impl.Task;
import com.guotingchao.model.impl.User;
import com.guotingchao.validator.front.AddTaskValidate;
import com.guotingchao.validator.front.LoginValidate;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Model;

/**
 * 前端Index控制器
 * @author os-yugq
 */

public class IndexController extends Controller{
	
	Logger log= Log4jLogger.getLogger(IndexController.class);
	/**
	 *  主页
	 */
	public void index(){
		setAttr("taskListAll", Task.taskDao.findAllTaskList());
		setAttr("taskListInit", Task.taskDao.findTaskListByType(0));
		setAttr("taskListOn", Task.taskDao.findTaskListByType(1));
		setAttr("taskListFinish", Task.taskDao.findTaskListByType(2));
		setAttr("taskListBlocked", Task.taskDao.findTaskListByType(-1));
		render("index.jsp");
	}
	/**
	 * 更新任务
	 */
	public void updateTask(){
		Long tid = getParaToLong();
		setSessionAttr("userList",User.userDao.findUserList());
		setAttr("task", Task.taskDao.findTaskById(tid));
		render("updateTask.jsp");
	}
	/**
	 * 添加新任务
	 */
	public void addTask(){
		setSessionAttr("userList",User.userDao.findUserList());
		render("addTask.jsp");
	}
	
	@Before(AddTaskValidate.class)
	public void doAddTask(){
		try {
			//保存新任务
			Task task =new Task();
			task.set("taskMaker", getPara("task.taskMaker"));
			task.set("taskInfo", getPara("task.taskInfo"));
			task.set("rank", getParaToInt("task.rank"));
			task.set("taskName", getPara("task.taskName"));
			SimpleDateFormat sdf = new  SimpleDateFormat( "yyyy-MM-dd" ); 
			Date play_time=sdf.parse(getPara("task.play_Time"));
			task.set("play_Time", play_time); 
			String[] uid = getPara("user.id").split(",");
			
			//批量保存处理
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
				setAttr("add_success_msg", "添加成功");
			}
		} catch (Exception e) {
			log.error("添加任务" + getPara("task.taskName")+ "失败,原因：" + e.getMessage());
			setAttr("add_success_msg", "添加失败");
		}
			render("addTask.jsp");
	}
	
	/**
	 * 登录
	 */
	
	public void login(){
		render("login.jsp");
	}
	/**
	 * 登录动作处理
	 */
	@Before(LoginValidate.class)
	public void doLogin() {
		
	}
	/**
	 * 退出登录
	 */
	public void loginOut(){
		removeSessionAttr("user_info");
		removeSessionAttr("actionKey");
		redirect("/");
	}
	
	
}
