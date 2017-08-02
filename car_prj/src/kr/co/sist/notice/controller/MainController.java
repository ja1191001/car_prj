package kr.co.sist.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.notice.domain.NoticeCntData;
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
	 public String mainPage(Model model, NoticeVO n_vo){//model�� �Ű������� ������ �ش�
		 
		String configLocation="kr/co/sist/notice/controller/app_con.xml";
		//Spring Container ���
		ApplicationContext ac=new ClassPathXmlApplicationContext(configLocation);
		
		//bean ������
		MainService ms=ac.getBean("main_service",MainService.class); //���÷�Ʈ
		
		
		//����ó�� ��� �ޱ�, View�� ����
		List<NoticeData> noticeList=ms.searchNotice();
		NoticeCntData ncd=ms.searchNoticeCnt();
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("notice_cnt",ncd);
		 return "main/index";
	 }//configLocation
	
	@RequestMapping(value="/notice/read_notice_detail.do")
	public String useNoticeDetail(Model model, @RequestParam(defaultValue="0")int num){
		
		//service
		String configLocation="kr/co/sist/notice/controller/app_con.xml";
		ApplicationContext ac=new ClassPathXmlApplicationContext(configLocation);
		
		MainService ms=ac.getBean("main_service",MainService.class);
		NoticeData nd= ms.searchNoticeDetail(num);
		
		
		model.addAttribute("detail_data",nd);
		
		return "notice/read_notice_detail";
	}//useNoticeDetail
	
	
}
