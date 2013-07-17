package com.guotingchao.interceptor;

import java.util.ArrayList;
import java.util.List;

import org.apache.taglibs.standard.tag.common.core.SetSupport;

import com.guotingchao.model.BaseModel;
import com.guotingchao.model.impl.T_user_task;
import com.guotingchao.model.impl.Task;
import com.guotingchao.model.impl.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

/**
 * fornt 路径拦截器
 * @author os-yugq
 *
 */
public class ForntMessageInterceptor  implements Interceptor {
	Logger log = Log4jLogger.getLogger(ForntMessageInterceptor.class);

	@Override
	public void intercept(ActionInvocation ai) {
		Controller c= ai.getController();
		User user =c.getSessionAttr("user_info");
		if(user!=null){
			Long uid = user.getLong("id");
			//获取有信息的任务
			List<BaseModel<T_user_task>> list = T_user_task.taskUserDao.findMsgTaskByUid(uid);
			
			if(list!=null){
				int count = list.size();
				//有信息的任务列表
				List<Task> taskList = new ArrayList<Task>(count);
				for(int i = 0;i < count;i++){
					taskList.add(Task.taskDao.findById(list.get(i).getInt("tid")));
				}
				if(taskList.size()>0){
					int last = taskList.size()-1;
					c.setSessionAttr("MsgTaskList", taskList);
					c.setSessionAttr("MsgTask", taskList.get(last));
					c.setSessionAttr("MsgCount", count);
				}
			}
			
		}
		ai.invoke();
		
	}
}
