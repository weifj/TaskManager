package com.guotingchao.model;
import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;


public class BaseModel<Class> extends Model<BaseModel<Class>>{
	private static final long serialVersionUID = 1L;
	public void batchSave(List<Model> modelList){
		List<String> sqlList = new ArrayList<String>();
		String[] temp=modelList.get(0).getClass().getName().split("\\.");String tableName=temp[temp.length-1];  //改
		for(Model model : modelList){
			StringBuffer sql = new StringBuffer("insert into "+tableName+"(" );
			StringBuffer name= new StringBuffer() ,value = new StringBuffer();
			
			String[] attr_names = model.getAttrNames();int attr_names_length = attr_names.length;
			String attx = ""; //前缀
			for(int i = 0 ; i<attr_names_length;i++){
				if(i>0){attx=",";}
				String attr_key =attr_names[i]; 
				name.append(attx+attr_key);
				value.append(attx+model.get(attr_key));
				
			}
			sql.append(name);
			sql.append(") values(");
			sql.append(value);
			sql.append(")");
			
			sqlList.add(sql.toString());
		}
		Db.batch(sqlList, sqlList.size());
	}
}
