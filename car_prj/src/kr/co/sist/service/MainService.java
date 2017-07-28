package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.MainDAO;
import kr.co.sist.domain.CarData;
import kr.co.sist.domain.EmpData;
@Component("main_service")
public class MainService {
	@Autowired
	private MainDAO md;
	
	//약결합을 위한 의존성 주입
//	public MainService(MainDAO md){
//		this.md=md;
//	}//MainService
	
	public List<CarData> searchCar(){
		
		List<CarData> list=null;
		
		try {
			list=md.selectCar();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchCar
	
	public List<EmpData> searchEmp(){
		
		List<EmpData> list=null;
		
		try {
			list=md.selectEmp();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchCar
	
	
}//class
