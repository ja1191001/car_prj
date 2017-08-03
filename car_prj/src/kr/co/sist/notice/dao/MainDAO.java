package kr.co.sist.notice.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.notice.domain.NoticeCntData;
import kr.co.sist.notice.domain.NoticeData;
import kr.co.sist.notice.vo.NoticeVO;
import kr.co.sist.notice.vo.NoticeValueVO;
@Component
public class MainDAO {
	
	@Autowired(required=false)
	
	public List<NoticeData> selectNotice(NoticeValueVO nvv)throws SQLException{
		List<NoticeData> list=null;
		
		SqlSession ss= GetSqlSession.getInstance().getSqlSession();
		System.out.println("------------------------"+ nvv);
		list=ss.selectList("noticeView",nvv);
		
		if(ss!=null){
			ss.close();
		}//end if
		
		return list;
	}//selectCar
	
	public NoticeCntData selectNoticeCnt()throws SQLException{
		NoticeCntData ncd =null;
		
		SqlSession ss= GetSqlSession.getInstance().getSqlSession();
		ncd=ss.selectOne("noticeCnt");
		System.out.println("DAO==="+ ncd);
		if(ss!=null){
			ss.close();
		}//end if
		
		return ncd;
	}//selectCar
	
	public NoticeData selectNoticeDetail( int num )throws SQLException{
		NoticeData nd=null;
		
		SqlSession ss= GetSqlSession.getInstance().getSqlSession();
		nd=ss.selectOne("noticeDetailView",num);
		if(ss!=null){
			ss.close();
		}//end if
		
		return nd;
	}//selectCar
}//class
