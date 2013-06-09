package com.guotingchao.contolle.admin;

import com.guotingchao.model.impl.User;
import com.guotingchao.validator.admin.AdminUserValidator;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

/**
 * @author os-guozc
 */
public class AdminManagerControlle extends Controller {
	Logger log = Log4jLogger.getLogger(AdminManagerControlle.class);

	/**
	 * 用户管理首页
	 */
	public void index() {
		setAttr("userList", User.userDao.findUserList());
	}

	/**
	 * 添加用户
	 */
	@Before(AdminUserValidator.class)
	public void add() {
		try{ 
			boolean result =getModel(User.class).save();
			if(result){
				setAttr("add_success_msg", "恭喜添加用户"+getPara("user.uname")+"成功,现在就可以登录");
			}
		}catch(Exception e){
			setAttr("add_success_msg", "添加用户"+getPara("user.uname")+"失败,原因："+e.getMessage());
		}
			render("addUser.jsp");
	}

	/**
	 * 删除用户
	 */
	public void delete() {

	}

	/**
	 * 更新用户信息
	 */
	public void update() {

	}

	/**
	 * 查询用户
	 */
	public void find() {

	}

	/**
	 * ================================ View 层转发
	 */
	public void addUser() {
	};
}
