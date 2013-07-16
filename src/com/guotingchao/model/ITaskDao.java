package com.guotingchao.model;

import java.util.List;
import java.util.Map;

import com.guotingchao.model.impl.Task;

public interface ITaskDao{
	
	public Map<String, Object> getAttrs();
	/**
	 * 获取所有任务
	 * @return List
	 */
	public List<Task> findAllTaskList();
	
	/**
	 * 通过任务类型获取任务列表
	 * @param taskType
	 * @return List
	 */
	public List<Task> findTaskListByType(int taskType);
	
	/**
	 * 通过id获取task
	 * @param id
	 * @return task
	 */
	public Task findTaskById(Long id);
	
	
}
