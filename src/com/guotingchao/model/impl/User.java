package com.guotingchao.model.impl;

import java.util.List;
import java.util.Map;

import com.guotingchao.model.IUserDao;
import com.jfinal.plugin.activerecord.Model;

public class User extends Model<User> implements IUserDao{
	private static final long serialVersionUID = 1L;
	public static User userDao = new User();
	@Override
	public List<User> findUserList() {
		return User.userDao.find("select * from user where flag != -2");
	}
	
	@Override
	public User findUser(Long id) {
		return User.userDao.findById(id);
	}
	
	public Map<String, Object> getAttrs(){
	    return super.getAttrs();
	}

	@Override
	public List<User> getUserByTaskId(Long tid) {
		return User.userDao.find("select * from user where id IN (SELECT uid FROM t_user_task WHERE tid=?)",tid);
	}
	
}
