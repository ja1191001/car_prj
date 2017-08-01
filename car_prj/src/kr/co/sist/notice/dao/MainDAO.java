package kr.co.sist.notice.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.notice.domain.NoticeData;
import kr.co.sist.notice.vo.NoticeVO;
@Component
public class MainDAO {
	
	@Autowired(required=false)
	
	public List<NoticeData> selectNotice()throws SQLException{
		List<NoticeData> list=null;
		
		SqlSession ss= GetSqlSession.getInstance().getSqlSession();
		list=ss.selectList("noticeView");
		if(ss!=null){
			ss.close();
		}//end if
		
		return list;
	}//selectCar
	
	public NoticeData selectNoticeDetail( String num )throws SQLException{
		NoticeData nd=null;
		
		SqlSession ss= GetSqlSession.getInstance().getSqlSession();
		nd=ss.selectOne("noticeDetailView",num);
		if(ss!=null){
			ss.close();
		}//end if
		
		return nd;
	}//selectCar
}//class
