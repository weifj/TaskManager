package com.guotingchao.model.impl;

import java.util.List;

import com.guotingchao.model.IUserDao;
import com.jfinal.plugin.activerecord.Model;

public class User extends Model<User> implements IUserDao{
	private static final long serialVersionUID = 1L;
	public static User userDao = new User();
	@Override
	public List<User> findUserList() {
		return null;
	}
}
