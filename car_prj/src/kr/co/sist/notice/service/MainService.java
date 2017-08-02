package kr.co.sist.notice.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.notice.dao.MainDAO;
import kr.co.sist.notice.domain.NoticeCntData;
import kr.co.sist.notice.domain.NoticeData;
import kr.co.sist.notice.vo.NoticeVO;
@Component("main_service")
public class MainService {
	@Autowired
	private MainDAO md;
	
	//약결합을 위한 의존성 주입
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
	
	public NoticeCntData searchNoticeCnt(){
		
		NoticeCntData ncd=null;
		
		try {
			ncd=md.selectNoticeCnt();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return ncd;
	}//searchNoticeCnt
	
//	public List<NoticeData> searchNoticeDetail(NoticeVO n_vo){
	public NoticeData searchNoticeDetail(int num){	
		NoticeData nd=null;
		try {
			nd=md.selectNoticeDetail( num );
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return nd;
	}//searchNotice
	
}//class
