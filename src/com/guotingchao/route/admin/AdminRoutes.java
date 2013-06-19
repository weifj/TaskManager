package com.guotingchao.route.admin;

import com.guotingchao.controlle.admin.AdminManagerControlle;
import com.jfinal.config.Routes;
/**
 * @author os-guozc
 */
public class AdminRoutes extends Routes {
	@Override
	public void config() {
		add("/admin", AdminManagerControlle.class,"/admin"); 
	}
}
