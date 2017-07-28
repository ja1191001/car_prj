package kr.co.sist.notice.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.notice.domain.NoticeData;
@Component
public class MainDAO {
	
	public List<NoticeData> selectNotice()throws SQLException{
		List<NoticeData> list=null;
		
		SqlSession ss= GetSqlSession.getInstance().getSqlSession();
		list=ss.selectList("noticeView");
		if(ss!=null){
			ss.close();
		}//end if
		
		return list;
	}//selectCar
	
}//class
