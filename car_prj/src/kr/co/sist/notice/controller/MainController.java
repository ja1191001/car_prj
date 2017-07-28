package kr.co.sist.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.notice.domain.NoticeData;
import kr.co.sist.notice.service.MainService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Controller
public class MainController {

	@RequestMapping(value="/index.do",method=GET)
	 public String mainPage(Model model){//model�� �Ű������� ������ �ش�
		 
//		String configLocation="kr/co/sist/controller/application_context.xml";
		String configLocation="kr/co/sist/controller/app_con.xml";
		//Spring Container ���
		ApplicationContext ac=new ClassPathXmlApplicationContext(configLocation);
		
		//bean ������
		MainService ms=ac.getBean("main_service",MainService.class); //���÷�Ʈ

		//����ó�� ��� �ޱ�, View�� ����
		List<NoticeData> noticeList=ms.searchNotice();
		
		model.addAttribute("noticeList",noticeList);
		
		 return "main/index";
	 }//configLocation
}
