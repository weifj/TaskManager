package com.guotingchao.model.impl;

import com.guotingchao.model.ITaskUserkDao;
import com.jfinal.plugin.activerecord.Model;
public class T_user_task extends Model<T_user_task> implements ITaskUserkDao{
	private static final long serialVersionUID = 1L;
	public static T_user_task taskUserDao = new T_user_task();
	
}
