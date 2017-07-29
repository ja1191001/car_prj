package kr.co.sist.notice.util;

import java.io.UnsupportedEncodingException;

public class HangulConv {

	/**
	 * 8859_1 charset�� UTF-8 charset���� ��ȯ 
	 * @param lor
	 * @return
	 */
	public static String toUTF(String kor){
		
		//��ü�� �����Ǿ� ���� �ʴٸ� ��Ƽ ����
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
	//��ü�� �����Ǿ� ���� �ʴٸ� ��Ƽ ����
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
