package com.guotingchao.route.front;

import com.guotingchao.controlle.front.IndexController;
import com.guotingchao.controlle.front.LoginController;
import com.guotingchao.controlle.front.ShowController;
import com.guotingchao.controlle.front.TaskAddController;
import com.guotingchao.controlle.front.TaskController;
import com.jfinal.config.Routes;

public class ForntRoutes extends Routes {
	
	@Override
	public void config() {
		add("/taskInfo/show",ShowController.class);
		add("/addTask",TaskAddController.class);
		add("/login",LoginController.class);
		add("/taskInfo",TaskController.class);
		add("/",IndexController.class);
	}
}
