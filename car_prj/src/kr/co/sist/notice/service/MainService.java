package kr.co.sist.notice.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.notice.dao.MainDAO;
import kr.co.sist.notice.domain.NoticeData;
@Component("main_service")
public class MainService {
	@Autowired
	private MainDAO md;
	
	//������� ���� ������ ����
//	public MainService(MainDAO md){
//		this.md=md;
//	}//MainService
	
	public List<NoticeData> searchNotice(){
		
		List<NoticeData> list=null;
		
		try {
			list=md.selectNotice();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchNotice
	
	
}//class