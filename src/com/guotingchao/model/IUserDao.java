package com.guotingchao.model;

import java.util.List;

import com.guotingchao.model.impl.User;

public interface IUserDao{
	public List<User> findUserList();
	public User	findUser(Long id);
}
