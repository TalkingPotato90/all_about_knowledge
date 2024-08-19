package kr.co.sist.aak.module.student.lecture.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.aak.domain.instructor.LectureDomain;
import kr.co.sist.aak.domain.student.UserLectureDomain;
import kr.co.sist.aak.domain.student.vo.UserApplySubVO;
import kr.co.sist.aak.domain.student.vo.UserQnaVO;
import kr.co.sist.aak.module.student.lecture.service.UserLectureService;

@Controller
public class UserLectureController {

	@Autowired(required=false)
	private UserLectureService uls;
	
	@GetMapping("/lecture_list.do")
	public String searchLectureList(Model model) {
		
		model.addAttribute("listLecture",uls.searchUserLecture());
		
		return "student/lecture/lecture_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "edu_cat_list.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String searchCategoryList() {

		return uls.searchCategoryList();
	}
	
	@ResponseBody
	@RequestMapping(value = "edu_subcat_list.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String searchSubCategoryList(String cat_code) {

		return uls.searchSubCategoryList(cat_code);

	}
	
	
	@GetMapping("/user_lecture_detail.do")
	public String detailLecture(@RequestParam("sub_code") String sub_code, Model model, HttpSession session) {
		UserLectureDomain uld = uls.searchUserLectureDetail(sub_code);
		UserLectureDomain uld2 = uls.searchUserLectureDetail(sub_code);//강의 디테일
		List<UserLectureDomain> uld3 = uls.searchInstNotice(sub_code);//강의공지 리스트
		List<UserLectureDomain> uld4 = uls.searchLecture(sub_code);//강의 목차 리스트
		List<UserLectureDomain> uld5 = uls.searchLecQna(sub_code);//강의 qna 리스트
		
		
		UserLectureDomain uld6 = uls.searchUserCnt(sub_code);//수강생 숫자 필요
		UserLectureDomain uld7 = uls.searchCatSubName(sub_code);//상하위카테고리 이름
		
		session.setAttribute("sub_code", sub_code);
		
		model.addAttribute("uld",uld);
		model.addAttribute("uld2",uld2);
		model.addAttribute("uld3",uld3);
		model.addAttribute("uld4",uld4);
		model.addAttribute("uld5",uld5);
		model.addAttribute("uld6",uld6);
		model.addAttribute("uld7",uld7);
//		System.out.println("-----------------------------------------------강의 qna 리스트"+uld5);
		/* System.out.println("aaaa"+uld); */
		return "student/lecture/lecture_detail";
	}

//	@PostMapping("/sub_qna_write_process.do")
//	public String addSiteQ(Principal principal, UserQnaVO uqVO, Model model) {
//		String s_stdId = principal.getName(); // std_id 가져오기
//	    uqVO.setS_stdId(s_stdId); // UserQnaVO에 설정
//	    String s_subCode=uqVO.getS_subCode();
//	    uqVO.setS_subCode(s_subCode);
//		
//		// 새로운 QNA_NO 생성
//	    String newQnaNo = uls.searchMaxQVal();
//	    uqVO.setS_qna_no(newQnaNo);
//
//	    // 문의사항 추가
//	    int cnt = uls.addSubQ(uqVO);
//	    if (cnt == 1) {
//	        model.addAttribute("uqVO", uqVO);
//	    }
//System.out.println("========================uqVO============================"+uqVO);
//	    return "redirect:/user_lecture_detail.do"; 
//	}
	
	@PostMapping("/sub_qna_write_process.do")
	public String addSiteQ(Principal principal,
	                       @RequestParam("s_subCode") String sub_code,
	                       UserQnaVO uqVO, Model model) {
	    String s_stdId = principal.getName(); // std_id 가져오기
	    uqVO.setS_stdId(s_stdId); // UserQnaVO에 설정
	    uqVO.setS_subCode(sub_code); // 파라미터로 받은 sub_code 설정
	    
	    // 새로운 QNA_NO 생성
	    String newQnaNo = uls.searchMaxQVal();
	    uqVO.setS_qna_no(newQnaNo);

	    // 문의사항 추가
	    int cnt = uls.addSubQ(uqVO);
	    if (cnt == 1) {
	        model.addAttribute("uqVO", uqVO);
	    }

	    System.out.println("========================uqVO============================"+uqVO);
	    return "redirect:/lecture_list.do";
	}
	
	
	@PostMapping("/apply_subject.do")
	@ResponseBody
	public Map<String, Object> addApplySub(Principal principal, UserApplySubVO uaVO, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
	    try {
	        String std_id = principal.getName();
	        String sub_code = (String) session.getAttribute("sub_code");

	        if (sub_code == null) {
	            throw new IllegalArgumentException("강의 코드가 없습니다.");
	        }

	        uaVO.setStd_id(std_id);

	        Map<String, String> info = new HashMap<>();
	        info.put("std_id", std_id);
	        info.put("sub_code", sub_code);

	        // 이미 수강 신청된 강의인지 확인
	        int existingApplicationCount = uls.applyBtnControl(info);
	        String message;
	        
	        if (existingApplicationCount != 0) {
	            // 이미 수강 신청된 경우
	            message = "이미 수강 신청된 강의입니다.";
	        } else {
	            // 새로운 수강 신청
	            int cnt = uls.addApplySub(uaVO);
	            if (cnt == 1) {
	                response.put("uqVO", uaVO);
	                message = "수강 신청 되었습니다.";
	            } else {
	                message = "수강 신청 중 오류가 발생했습니다.";
	            }
	        }

	        response.put("message", message);
	        response.put("status", "success");

	    } catch (Exception e) {
	        response.put("message", "수강 신청 중 오류가 발생했습니다.");
	        response.put("status", "error");
	        e.printStackTrace();
	    }
	    return response;
	}

//	@GetMapping("/cat_code_lecture.do")
//    @ResponseBody
//    public List<UserLectureDomain> getLecturesByCategory(@RequestParam String category) {
//        
//		
//		return uls.getLecturesByCategory(category);
//    }
//
//    @GetMapping("/sub_categories.do")
//    @ResponseBody
//    public List<UserLectureDomain> getSubCategories(@RequestParam String category) {
//        
//    	
//    	return uls.getSubCategories(category);
//    }
//	
	
	
	
}
