package kr.co.sist.notice.util;

import java.io.UnsupportedEncodingException;

public class HangulConv {

	/**
	 * 8859_1 charset을 UTF-8 charset으로 변환 
	 * @param lor
	 * @return
	 */
	public static String toUTF(String kor){
		
		//객체가 생성되어 있지 않다면 엠티 설정
		if(kor==null){
			kor="";
		}//end if
		
		try{
			if(!kor.equals("")){
				kor=new String(kor.getBytes("8859_1"), "UTF-8");
			}//end if
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}//end catch
		return kor;
	}//toUTF
	
	public static String toEUC(String kor){
	//객체가 생성되어 있지 않다면 엠티 설정
	if(kor==null){
		kor="";
	}//end if
	
	try{
		if(!kor.equals("")){
			kor=new String(kor.getBytes("8859_1"), "UTF-8");
		}//end if
	}catch(UnsupportedEncodingException e){
		e.printStackTrace();
	}//end catch
	return kor;
	}//toEUC
	
}//class
