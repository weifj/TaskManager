package com.guotingchao.model.impl;

import java.util.List;
import java.util.Map;

import com.guotingchao.model.ITaskDao;
import com.jfinal.plugin.activerecord.Model;
public class Task extends Model<Task> implements ITaskDao{
	private static final long serialVersionUID = 1L;
	public static Task taskDao = new Task();
	
	public Map<String, Object> getAttrs(){
	    return super.getAttrs();
	}

	
	
	@Override
	public List<Task> findAllTaskList() {
		
		return Task.taskDao.find("select * from task ");
	}
	
	@Override
	public List<Task> findTaskListByType(int taskType) {
		return Task.taskDao.find("select * from task where tasktype = ? ",taskType);
	}
	
	@Override
	public Task findTaskById(Long id) {
		return Task.taskDao.findById(id);
	}



	@Override
	public List<Task> findTaskByUser(String uname) {
		
		return Task.taskDao.find("select * from task where taskMaker = ? ",uname);
	}
	
	
}
