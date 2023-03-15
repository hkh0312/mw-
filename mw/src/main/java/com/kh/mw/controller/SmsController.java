package com.kh.mw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mw.service.HService;
import com.kh.mw.service.SmsService;
import com.kh.mw.service.Y_CreateService;
import com.kh.mw.vo.H_HomeScheduleVo;
import com.kh.mw.vo.H_HomeVo;
import com.kh.mw.vo.H_TravelVo;
import com.kh.mw.vo.UserVo;
import com.kh.mw.vo.Y_HomeVo;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/sms/*")
public class SmsController {
	
	@Autowired
	private SmsService smsService;
	@Autowired
	private Y_CreateService ycreateService;
	@Autowired
	private HService hService;
	
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	@ResponseBody
	public String sendMessage(@RequestParam(value="arr_g_no[]") String[] arr_g_no, HttpSession session) throws CoolsmsException {	// 15번 가능 -> 14
//		System.out.println(arr_g_no);
		
		String phonenumber = String.join(",", arr_g_no);
		String to = phonenumber.replaceAll("-", "");
		
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		System.out.println(userVo);
		
		String server_addr = "";
		String groomNm = ""; 
		String brideNm = "";
		String webdate = "";
		String webtime = "";
		String webaddr = "";
		
		if(userVo.getTemptype().equals(null) || userVo.getTemptype() == "") {
			
		}else if(userVo.getTemptype().equals("Y")) {
			server_addr = "192.168.0.217/create/invite?url=";
			Y_HomeVo yVo = ycreateService.searchHome(userVo.getUserid());
			groomNm = yVo.getGroomNm();
			brideNm = yVo.getBrideNm();
			webdate = yVo.getWedDate();
			webtime = yVo.getWedTime();
			webaddr = yVo.getWed_addr();
			
		} else if(userVo.getTemptype().equals("H")) {
			server_addr = "192.168.0.217/url/";
			H_HomeVo hVo = hService.getHvo(userVo.getUserid());
			H_TravelVo tVo = hService.getTvo(userVo.getUserid());
			groomNm = hVo.getH_gname();
			brideNm = hVo.getH_bname();
			webdate = hVo.getH_weddate();
			webaddr = tVo.getT_wedloc();
		}
		String web_addr = server_addr + userVo.getUrl();
		
		System.out.println(web_addr);
		String text = "저희 결혼합니다♥\n" + groomNm + "♥" + brideNm + " 결혼식에 초대합니다.\n" + "일시 : " + webdate + webtime + "\n장소 : " + webaddr +"\n청첩장 : " + web_addr;
		System.out.println(text);
		smsService.certifiedPhoneNumber(to, text);		
		return null;
	}
	
}
