package kr.co.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.domain.CarData;
import kr.co.sist.domain.EmpData;
import kr.co.sist.service.MainService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Controller
public class MainController {

	@RequestMapping(value="/index.do",method=GET)
	 public String mainPage(Model model){//model을 매개변수로 선언해 준다
		 
//		String configLocation="kr/co/sist/controller/application_context.xml";
		String configLocation="kr/co/sist/controller/app_con.xml";
		//Spring Container 사용
		ApplicationContext ac=new ClassPathXmlApplicationContext(configLocation);
		
		//bean 꺼내기
		MainService ms=ac.getBean("main_service",MainService.class); //리플렉트

		//업무처리 결과 받기, View로 전달
		List<CarData> carList=ms.searchCar();
		List<EmpData> empList=ms.searchEmp();
		
		model.addAttribute("carList",carList);
		model.addAttribute("empList",empList);
		
		 return "main/index";
	 }//configLocation
}
