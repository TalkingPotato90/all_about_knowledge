package kr.co.sist.aak;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.aak.module.student.lecture.service.UserLectureService;

@Controller
public class HomeController {
	
	@Autowired(required=false)
	private UserLectureService uls;
	
	/*
	@GetMapping("/index.do")
	public String main(){
		return "student/home";
	}
	*/
	@GetMapping("/index.do")
	public String main(Model model){
		model.addAttribute("listLecture",uls.searchPopLecture());
		model.addAttribute("listLecture2",uls.searchLatestLecture());
		
		return "student/home";
	}
	
	@GetMapping("/admin_index.do")
	public String adminMain() {
		return "/admin/login";
	}
	@GetMapping("/instructor_index.do")
	public String instructorMain() {
		return "instructor/login";
	}
}
