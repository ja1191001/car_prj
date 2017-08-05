package kr.co.sist.notice.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.notice.dao.MainDAO;
import kr.co.sist.notice.domain.NoticeCntData;
import kr.co.sist.notice.domain.NoticeData;
import kr.co.sist.notice.domain.NoticePageData;
import kr.co.sist.notice.util.HangulConv;
import kr.co.sist.notice.vo.NoticeVO;
import kr.co.sist.notice.vo.NoticeValueVO;
import oracle.sql.TIMESTAMPLTZ;
@Component("main_service")
public class MainService {
	@Autowired
	private MainDAO md;
	
	//약결합을 위한 의존성 주입
//	public MainService(MainDAO md){
//		this.md=md;
//	}//MainService
	
	public List<NoticeData> searchNotice(NoticeValueVO nvVO){
		
		List<NoticeData> list=null;
		
		try {
			list=md.selectNotice(nvVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchNotice
	
	public NoticeValueVO inputValue(NoticeCntData ncd, int currentPage, String columnName, String keyword){
		NoticeValueVO nvv=new NoticeValueVO();
		int pageScale=15;
		int endNum=ncd.getNum()-(currentPage-1)*pageScale; 
		int startNum=endNum-14;
		
		if(endNum<=15){startNum=1;}//해당목록 최고 번호가 15 밑이라면 시작번호는 무조건 1번
		
//		keyword="%"+HangulConv.toUTF(keyword)+"%";
		keyword="%"+keyword+"%";
		System.out.println(keyword+"------무엇으로 찍히나-----");
		
		nvv.setStartNum(startNum);
		nvv.setEndNum(endNum);
		nvv.setColumName(columnName);
		nvv.setKeyword(keyword);
		
		return nvv;
	}
	
	public NoticePageData searchNoticePage(int currentPage, NoticeCntData ncd){
		NoticePageData npd=new NoticePageData();;
		//전체 글 수
		int totalCount=ncd.getNum();
		//한 페이지에 나올 글 수
		int pageScale=15;
		//전체 페이지 수
		int totalPage=0;
		
		totalPage=totalCount/pageScale;
		if(totalCount%pageScale!=0){totalPage++;}//나머지가 존재하는 경우 페이지 추가
		
		int firstPage=(currentPage-1)/10;
		firstPage=firstPage*10+1;
		int lastPage=firstPage+9;
		
		if(totalPage<lastPage){lastPage=totalPage;}//마지막 페이지가 10페이지가 안될 경우
		
		npd.setTatalPage(totalPage);
		npd.setFirstPage(firstPage);
		npd.setLastPage(lastPage);
		npd.setCurrentPage(currentPage);
		return npd;
	}
	
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
