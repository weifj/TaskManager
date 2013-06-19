package com.guotingchao.model;

import java.util.List;

import com.guotingchao.model.impl.Task;

public interface ITaskDao{
	
	
	/*
	 * 通过任务类型获取任务列表
	 */
	public List<Task> findTaskListByType(int taskType);
	
	public Task findTaskById(Long id);
	
}
