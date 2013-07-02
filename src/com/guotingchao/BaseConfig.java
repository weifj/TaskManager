package com.guotingchao;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.guotingchao.model.impl.T_user_task;
import com.guotingchao.model.impl.Task;
import com.guotingchao.model.impl.User;
import com.guotingchao.route.admin.AdminRoutes;
import com.guotingchao.route.front.ForntRoutes;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.JspRender;
import com.jfinal.render.ViewType;

public class BaseConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
		me.setEncoding("UTF-8");
		me.setError404View("/404.html");
		me.setBaseViewPath("WEB-INF/fornt");
		JspRender.setSupportActiveRecord(true);
	}

	@Override
	public void configRoute(Routes me) {
		me.add(new AdminRoutes());
		me.add(new ForntRoutes());
	}

	@Override
	public void configHandler(Handlers me) {
		//		DruidStatViewHandler dvh = new DruidStatViewHandler("/druid");
		//		me.add(dvh);
	}
	/**
	 *  添加一个全局的拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		
	}

	@Override
	public void configPlugin(Plugins me) {
		DruidPlugin dp = new DruidPlugin(
				"jdbc:MySQL://localhost:3306/TaskManager", "root", "root");
		dp.addFilter(new StatFilter());
		WallFilter wall = new WallFilter();
		wall.setDbType("mysql");
		dp.addFilter(wall);
		me.add(dp);
		// ActiveRecordPlugin
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		arp.addMapping("User", User.class);
		arp.addMapping("Task", Task.class); 
		arp.addMapping("T_user_task", T_user_task.class);
		me.add(arp);

	}

}
