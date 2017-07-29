package kr.co.sist.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.notice.domain.NoticeData;
import kr.co.sist.notice.service.MainService;
import kr.co.sist.notice.vo.NoticeVO;
import kr.co.sist.notice.util.HangulConv;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Controller
public class MainController {

	@RequestMapping(value="/index.do",method=GET)
	 public String mainPage(Model model){//model�� �Ű������� ������ �ش�
		 
		String configLocation="kr/co/sist/notice/controller/app_con.xml";
		//Spring Container ���
		ApplicationContext ac=new ClassPathXmlApplicationContext(configLocation);
		
		//bean ������
		MainService ms=ac.getBean("main_service",MainService.class); //���÷�Ʈ

		//����ó�� ��� �ޱ�, View�� ����
		List<NoticeData> noticeList=ms.searchNotice();
		List<NoticeData> noticeDetailList=ms.searchNoticeDetail();
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("noticeDetailList",noticeDetailList);
		
		 return "main/index";
	 }//configLocation
	
	@RequestMapping(value="/notice/read_notice_detail.do")
	public String useNoticeDetail(Model model, NoticeVO nv){
		
		model.addAttribute("data",nv);
		
		return "notice/read_notice_detail.do";
	}//useNoticeDetail
	
}
