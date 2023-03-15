package com.kh.mw.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mw.service.MyPageService;
import com.kh.mw.service.UserService;
import com.kh.mw.service.Y_CreateService;
import com.kh.mw.service.Y_LikeService;
import com.kh.mw.util.YFileUploader;
import com.kh.mw.vo.UserVo;
import com.kh.mw.vo.Y_AskVo;
import com.kh.mw.vo.Y_HomeVo;
import com.kh.mw.vo.Y_LikeVo;
import com.kh.mw.vo.Y_MessageVo;
import com.kh.mw.vo.Y_PhotoVo;
import com.kh.mw.vo.Y_QnaVo;
import com.kh.mw.vo.Y_StoryVo;
import com.kh.mw.vo.Y_TravelVo;

@Controller
@RequestMapping(value = "/create/*")
public class YCreateController {
	@Autowired
	private Y_CreateService y_createService;
	@Autowired
	private Y_LikeService y_likeService;
	@Autowired
	private UserService userService;
	@Autowired
	private MyPageService myPageService;

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String insertInfo(HttpSession session, Model model) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		
		model.addAttribute("userVo", userVo);
		return "/create/form";
	}

	@RequestMapping(value = "/insertRun", method = RequestMethod.POST)
	public String insertRun(@RequestParam("multiFile") List<MultipartFile> multiFileList, Y_HomeVo homeVo,
			Y_StoryVo storyVo, Y_QnaVo qnaVo, Y_TravelVo travelVo, Y_PhotoVo photoVo, RedirectAttributes rttr,
			Model model, HttpServletRequest request, HttpSession session) {
			UserVo userVo = (UserVo)session.getAttribute("loginInfo");
			String clientId = userVo.getUserid();
			homeVo.setClientId(clientId);
			storyVo.setClientId(clientId);
			qnaVo.setClientId(clientId);
			travelVo.setClientId(clientId);
			photoVo.setClientId(clientId);
		
		//사진 입력
		for (int i = 0; i < multiFileList.size(); i++) {
			try {
				String str_coverPic = multiFileList.get(0).getOriginalFilename();
				if (str_coverPic != null && !str_coverPic.equals("")) {
					String coverPic = uploadFile(multiFileList.get(0));
					homeVo.setCoverPic(coverPic);
				}
				String str_pic_one = multiFileList.get(1).getOriginalFilename();
				if (str_pic_one != null && !str_pic_one.equals("")) {
					String story_one_pic = uploadFile(multiFileList.get(1));
					storyVo.setStory_one_pic(story_one_pic);
				}
				String str_pic_two = multiFileList.get(2).getOriginalFilename();
				if (str_pic_two != null && !str_pic_two.equals("")) {
					String story_two_pic = uploadFile(multiFileList.get(2));
					storyVo.setStory_two_pic(story_two_pic);
				}
				String str_mespic = multiFileList.get(3).getOriginalFilename();
				if (str_mespic != null && !str_mespic.equals("")) {
					String mespic = uploadFile(multiFileList.get(3));
					photoVo.setMespic(mespic);
				}
				String str_mapPic = multiFileList.get(4).getOriginalFilename();
				if (str_mapPic != null && !str_mapPic.equals("")) {
					String mapPic = uploadFile(multiFileList.get(4));
					travelVo.setMapPic(mapPic);
				}
				String str_footerpic = multiFileList.get(5).getOriginalFilename();
				if (str_footerpic != null && !str_footerpic.equals("")) {
					String footerpic = uploadFile(multiFileList.get(5));
					photoVo.setFooterpic(footerpic);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // for
//			System.out.println("homeVo: " + homeVo);
//			System.out.println("storyVo: " + storyVo);
//			System.out.println("qnaVo: " + qnaVo);
//			System.out.println("travelVo: " + travelVo);
//			System.out.println("photoVo:" + photoVo);
		//qna작업						
		if( qnaVo.getArr_ques() != null || qnaVo.getArr_answers() != null) {
			String [] str_ques = qnaVo.getArr_ques();
			String [] str_answers = qnaVo.getArr_answers();
			for (int i = 0; i < str_ques.length; i++) {
				if (str_ques[i] != null || str_answers[i] != null) {
					qnaVo.setQues(str_ques[i]);
					qnaVo.setAnswer(str_answers[i]);
					y_createService.insertQnA(qnaVo);
				}
			}
		}
		if(qnaVo.getUpdate_ques() != null || qnaVo.getUpdate_answers() != null) {
			String[] update_ques  = qnaVo.getUpdate_ques();
			String[] update_answers = qnaVo.getUpdate_answers();
			for(int i = 0; i <update_ques.length; i++) {
				if(update_ques[i] != null || update_answers[i] != null ) {
					qnaVo.setQues(update_ques[i]);
					qnaVo.setAnswer(update_answers[i]);
//					System.out.println("update for state: " + qnaVo);
					y_createService.updateQna(qnaVo);
				}			
			}
		}
		//update pjnum
		int prevPjnum = Integer.parseInt(request.getParameter("pjnum"));
//		System.out.println("prevPjnum: " + prevPjnum);
		if(prevPjnum == 0) {
			String userid = userVo.getUserid();
			int pjnum = userService.updatepjnum(prevPjnum, userid);
			userVo.setPjnum(pjnum);
//			System.out.println("pjnum: " + pjnum);
		}
		
		boolean result = y_createService.insert(homeVo, storyVo, travelVo, photoVo, prevPjnum);
		if(result) {
			userVo.setTemptype("Y");
			myPageService.modify(userVo);
		}
//		System.out.println("controller, tempuser: " + userVo);
//		return "redirect:/create/mw";
		return "redirect:/create/updateform";
	}

	public String uploadFile(MultipartFile file) throws Exception {
//		System.out.println("file: " + file);
		String origionalName = file.getOriginalFilename();
		System.out.println("filename: " + origionalName);
		String filename = YFileUploader.uploadFile(origionalName, file.getBytes());
		System.out.println("filename: " + filename);
		return filename;
	}
	
	//사용자가 직접 불러오기 
	@RequestMapping(value = "/mw", method = RequestMethod.GET)
	public String search(Model model, HttpSession session) {
//		System.out.println("create search");
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");		
		String clientId = userVo.getUserid();
//		System.out.println("create search id:" + clientId);
		Map<String, Object> map = y_createService.searchInfo(clientId);
		model.addAttribute("map", map);
		model.addAttribute("url", clientId);
		model.addAttribute("userVo", userVo);
		return "/create/home";
	}
	// 생성된 청첩장 보기
	@RequestMapping(value="/invite", method=RequestMethod.GET)
	public String invite(String url, Model model, HttpSession session) {
//		System.out.println("invite: " + url);
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		String clientId = userService.findid(url);
//		System.out.println("invite id: " + clientId);
		Map<String, Object> map = y_createService.searchInfo(clientId);
		model.addAttribute("map", map);
		model.addAttribute("url", clientId);
		return "/create/home";
	}
	
	@RequestMapping(value = "/updateform", method = RequestMethod.GET)
	public String updateform(Model model,HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		String clientId = userVo.getUserid();
		Map<String, Object> map = y_createService.searchInfo(clientId);
		model.addAttribute("userVo", userVo);
		model.addAttribute("map", map);
		return "/create/form";
	}

	@RequestMapping(value = "/displayImg", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public byte[] displayImg(String pic) {
		FileInputStream fis = null;
		if(pic != null) {
			try {
				fis = new FileInputStream(pic);
				byte[] bytes = IOUtils.toByteArray(fis);
				return bytes;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (fis != null)
						fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}// displayImg
	
	@RequestMapping(value="/delqna", method= RequestMethod.GET)
	@ResponseBody
	public boolean delQna (int qno, String clientId) {	
//		System.out.println("delqna qno: " + qno);
//		System.out.println("delqna clientId: " + clientId);
//		System.out.println("delqna");
		Y_LikeVo likeVo = new Y_LikeVo(qno, clientId);
		int likecount = y_likeService.isLike(likeVo);
//		System.out.println("controller delQna: " + likecount);
		if(likecount > 0) {
			boolean likedel = y_likeService.delLike(likeVo);
			if(likedel == true) {
				y_createService.delQna(qno, clientId);
			}else if(likedel == false){
				y_createService.delQna(qno, clientId);
			}
		}else if(likecount == 0) {
			y_createService.delQna(qno, clientId);
		}		
		return true;
	}
	
	@RequestMapping(value = "/story", method = RequestMethod.GET)
	public String getStory(Model model, HttpSession session, String url) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		String clientId = userVo.getUrl();
		System.out.println("story:" + clientId);
		Y_StoryVo storyVo = y_createService.searchStory(clientId);
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("storyVo", storyVo);
		map.put("photoVo", photoVo);
		System.out.println(map);
		model.addAttribute("map", map);
		model.addAttribute("url", clientId);
		return "/create/story";
	}

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String getQna(Model model, HttpSession session, String url) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		String clientId = userVo.getUserid();
		String clientId = url;
//		System.out.println("qna controller: " + clientId);
		List<Y_QnaVo> qnalist = y_createService.searchQna(clientId);
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("qnalist", qnalist);
		map.put("photoVo", photoVo);
		map.put("homeVo", homeVo);
		model.addAttribute("map", map);
		model.addAttribute("url", clientId);
		return "/create/qna";
	}

	@RequestMapping(value = "/showmes", method = RequestMethod.GET)
	public String getMes(Model model, HttpSession session, String url) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		String clientId = userVo.getUserid();
		String clientId = userVo.getUrl();
//		System.out.println("qna controller: " + clientId);
		List<Y_MessageVo> meslist = y_createService.searchMes(clientId);
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("photoVo", photoVo);
		map.put("meslist", meslist);
		model.addAttribute("map", map);
		model.addAttribute("url", clientId);
		return "/create/show_message";
	}

	@RequestMapping(value = "/travel", method = RequestMethod.GET)
	public String getTravel(Model model, HttpSession session, String url) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		String clientId = userVo.getUserid();
		String clientId = userVo.getUrl();
		Y_TravelVo travelVo = y_createService.searchTravel(clientId);
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("travelVo", travelVo);
		map.put("photoVo", photoVo);
		model.addAttribute("map", map);
		model.addAttribute("url", clientId);
		return "/create/travel";
	}

	@RequestMapping(value = "/insertmes", method = RequestMethod.GET)
	public String insertMes(Model model, HttpSession session, String url) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		String clientId = userVo.getUserid();
		String clientId = userVo.getUrl();
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("photoVo", photoVo);
		model.addAttribute("map", map);
		model.addAttribute("url", clientId);
		return "/create/insert_message";
	}

	@RequestMapping(value = "/message", method = RequestMethod.POST)
	public String insertMes(MultipartFile file, Y_MessageVo mesVo, HttpSession session, Model model, String url) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		mesVo.setClientId(userVo.getUserid());
//		System.out.println("message url: " + url);
		mesVo.setClientId(userVo.getUrl());
		try {
//			System.out.println("create/message");
//			System.out.println("message: " + mesVo);
			String filename = uploadFile(file);
			mesVo.setMespic(filename);
			y_createService.insertMes(mesVo);
			model.addAttribute("url", url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/create/showmes";
	}

	@RequestMapping(value = "/ask", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertQues(Y_AskVo askVo, Model model) {
//		System.out.println("ask");
		boolean result = y_createService.insertQues(askVo);
		if (result == true) {
			return true;
		}
		return false;
	}
	//샘플구현
	@RequestMapping(value="/ysample", method=RequestMethod.GET)
	public String getSample() {
		return "/create/ysample";
	}
	@RequestMapping(value="/sampleStory", method=RequestMethod.GET)
	public String sampleStory() {
		return "/create/sample_story";
	}
	@RequestMapping(value="/sampleQna", method=RequestMethod.GET)
	public String sampleQna() {
		return "/create/sample_qna";
	}
	@RequestMapping(value="/sampleMes", method=RequestMethod.GET)
	public String sampleMes() {
		return "/create/sample_mes";
	}
	@RequestMapping(value="/sampleSend", method=RequestMethod.GET)
	public String sampleSend() {
		return "/create/sample_send";
	}
	@RequestMapping(value="/sampleTravel", method=RequestMethod.GET)
	public String sampleTravel() {
		return "/create/sample_travel";
	}
//	//템플렛삭제
//	@RequestMapping(value = "/create/delete", method = RequestMethod.GET)
//	public String delete(HttpSession session, RedirectAttributes rttr) {
//		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		String clientId = userVo.getUserid();
//		// 삭제할때, foreign key - child element도 같이 삭제해줘야함
//		boolean result = y_createService.delete(clientId);
//		String page = "";
//		if(result == true) {
//			userVo.setPjnum(0);
//			userVo.setTemptype(null);
//			userService.modify(userVo);
//			page = "redirect:/board/main";
//		}
//			rttr.addFlashAttribute("result", "fail_delete");
//			return "/create/updateform";
//	}
//}


//템플렛삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, RedirectAttributes rttr) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		String clientId = userVo.getUserid();
		// 삭제할때, foreign key - child element도 같이 삭제해줘야함
		int likecount = y_likeService.likecheck(clientId);
		System.out.println("create controller delete: " + likecount);
		boolean result = false;
		String page;
		if(likecount > 0) {
			boolean result_delLike = y_likeService.delete(clientId);
			if(result_delLike == true) {
				result = y_createService.delete(clientId);
			}else {
				rttr.addFlashAttribute("result", "fail_delete");
				return "/create/updateform";
			}
		}else {
			result = y_createService.delete(clientId);
		}
		
		if(result == true) {
			userVo.setPjnum(0);
			userVo.setTemptype(null);
			myPageService.modify(userVo);
			page = "redirect:/board/main";
		}
			rttr.addFlashAttribute("result", "fail_delete");
			return "/create/updateform";
	}
}