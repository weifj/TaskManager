package com.guotingchao.model;

import java.util.List;
import java.util.Map;

import com.guotingchao.model.impl.User;

public interface IUserDao{
	public List<User> findUserList();
	public User	findUser(Long id);
	public Map<String, Object> getAttrs();
	/**
	 * 通过tid获取user
	 * @param tid
	 * @return
	 */
	public List<User> getUserByTaskId(Long tid);
}
