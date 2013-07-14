package com.guotingchao.model.impl;

import java.util.List;

import com.guotingchao.model.BaseModel;
import com.guotingchao.model.ITaskUserkDao;
public class T_user_task extends BaseModel<T_user_task> implements ITaskUserkDao{
	private static final long serialVersionUID = 1L;
	public static T_user_task taskUserDao = new T_user_task();
	
	@Override
	public String[] getUidArray(Long tid) {
		List<BaseModel<T_user_task>> list = taskUserDao.find("select uid from t_user_task where tid=?", tid);
		int count = list.size();
		String[] uid = new String[count];
		for(int i = 0;i < count; i++){
			uid[i] = list.get(i).getLong("uid")+"";
		}
		return uid;
	}

	@Override
	public boolean deleteByTidAndUid(Long tid, Long uid) {
		Long id = taskUserDao.find("select id from t_user_task where tid=? and uid=?", tid,uid)
				.get(0).getLong("id");
		return taskUserDao.deleteById(id);
	}

	@Override
	public List<BaseModel<T_user_task>> findMsgTaskByUid(Long uid) {
		
		return taskUserDao.find("select * from t_user_task where messageType=0 and uid=? ", uid);
	
	}
	
}
