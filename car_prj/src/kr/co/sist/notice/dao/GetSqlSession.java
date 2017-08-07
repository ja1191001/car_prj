package kr.co.sist.notice.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GetSqlSession {

	private static GetSqlSession gss;
	private static SqlSessionFactoryBuilder ssfb;
	
	private GetSqlSession(){
		//MyBatis로그를 남기기 위한 method 호출
		
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static GetSqlSession getInstance(){
		if( gss == null ){
			gss=new GetSqlSession();
		}//end if
		return gss;
	}//getInstance

	private static SqlSessionFactory ssf =null;
	
	private SqlSessionFactory getFactoryBuilder(){
		SqlSessionFactory ssf = null;
		if(ssf==null){
			ssfb=new SqlSessionFactoryBuilder();
			try {
				Reader reader = Resources.getResourceAsReader("kr/co/sist/notice/dao/config/mybatis_config.xml");
				ssf=ssfb.build(reader);
				
				if(reader != null){
					reader.close();
				}//end if
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}//end if
		return ssf;
	}//getFactoryBuilder
	
	public SqlSession getSqlSession(){
		SqlSession ss = getFactoryBuilder().openSession();  
			
		return ss;
	}//getSqlSession
	
}//class
