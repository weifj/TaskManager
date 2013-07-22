package com.guotingchao.model.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.guotingchao.BaseConfig;
import com.guotingchao.PaginationContext;
import com.guotingchao.model.BaseModel;
import com.guotingchao.model.ITaskDao;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
public class Task extends Model<Task> implements ITaskDao{
	public static Logger log = Log4jLogger.getLogger(BaseModel.class);
	private static final long serialVersionUID = 1L;
	static Properties prop = new Properties();
	static{
		InputStream in = BaseConfig.class.getClassLoader().getResourceAsStream("config.properties");
		try{
			prop.load(in);
		}catch(IOException e){
			log.error(e.getMessage());
		}
	}
	public static Task taskDao = new Task();
	
	public Map<String, Object> getAttrs(){
	    return super.getAttrs();
	}

	
	
	@Override
	public List<Task> findAllTaskList() {
		
		return Task.taskDao.find("select * from task ");
	}
	
	@Override
	public Page<Task> findTaskListByType(int taskType) {
		int pageSize = Integer.parseInt(prop.getProperty("pageSize"));
		int pageNo = PaginationContext.getPageNo();
		String sqlExceptSelect="from task where tasktype ="+taskType;
		Page<Task> page = Task.taskDao.paginate(pageNo, pageSize, "select * ", sqlExceptSelect);
		System.out.println("TotalPage"+page.getTotalPage());
		System.out.println("TotalRow"+page.getTotalRow());
		System.out.println("PageNumber"+page.getPageNumber());
		
		return page;
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
