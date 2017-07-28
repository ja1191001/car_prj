package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.CarData;
import kr.co.sist.domain.EmpData;
@Component
public class MainDAO {
	
	public List<CarData> selectCar()throws SQLException{
		List<CarData> list=null;
		
		SqlSession ss= GetSqlSession.getInstance().getSqlSession();
		list=ss.selectList("mainCarView");
		if(ss!=null){
			ss.close();
		}//end if
		
		return list;
	}//selectCar
	
	public List<EmpData> selectEmp()throws SQLException{
		List<EmpData> list=null;
		
		SqlSession ss= GetSqlSession.getInstance().getSqlSession();
		list=ss.selectList("empView");
		if(ss!=null){
			ss.close();
		}//end if
		
		return list;
	}//selectCar
	
}//class
