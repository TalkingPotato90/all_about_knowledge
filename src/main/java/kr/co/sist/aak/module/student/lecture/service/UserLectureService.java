package kr.co.sist.aak.module.student.lecture.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.co.sist.aak.domain.admin.EduCategoryManagementDomain;
import kr.co.sist.aak.domain.instructor.LectureDomain;
import kr.co.sist.aak.domain.student.UserLectureDomain;
import kr.co.sist.aak.domain.student.UserNoticeDomain;
import kr.co.sist.aak.domain.student.vo.UserApplySubVO;
import kr.co.sist.aak.domain.student.vo.UserQnaVO;
import kr.co.sist.aak.module.student.lecture.dao.UserLectureDAO;

@Service
public class UserLectureService {

	@Autowired(required=false)
	private UserLectureDAO ulDAO;
	
	public List<UserLectureDomain> searchUserLecture(){
		List<UserLectureDomain> list = null;
		try {
			list=ulDAO.selectAllUserLecture();
			//System.out.println("aaaaa"+list);
		} catch(PersistenceException pe) {
			pe.printStackTrace(); 
		}
		return list;
	}//searchUserLecture
	
	
	public UserLectureDomain searchUserLectureDetail(String sub_code){
		UserLectureDomain uld = null;
		try {
			uld=ulDAO.selectOneUserLecture(sub_code);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return uld;
	}//searchUserLectureDetail
	
	
	public UserLectureDomain searchUserCnt(String sub_code){
		UserLectureDomain uld = null;
		try {
			uld=ulDAO.selectStdCnt(sub_code);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return uld;
	}//searchUserLectureDetail
	
	public UserLectureDomain searchCatSubName(String sub_code){
		UserLectureDomain uld = null;
		try {
			uld=ulDAO.selectCatSubName(sub_code);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return uld;
	}//searchUserLectureDetail
	
	public List<UserLectureDomain> searchInstNotice(String sub_code){
		List<UserLectureDomain> list = null;
		try {
		list=ulDAO.selectAllInstNotice(sub_code);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchInstNotice
	
	public List<UserLectureDomain> searchLecture(String sub_code){
		List<UserLectureDomain> list = null;
		try {
			list=ulDAO.selectAllLecture(sub_code);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchInstNotice
	
	/**
	 * 강의 문의 리스트
	 * @param sub_code
	 * @return
	 */
	public List<UserLectureDomain> searchLecQna(String sub_code){
		List<UserLectureDomain> list = null;
		try {
			list=ulDAO.selectAllLecQna(sub_code);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchInstNotice
	
	/**
	 * 나의 문의 리스트
	 * @param Q_std_id
	 * @return
	 */
	public List<UserLectureDomain> searchMyLecQna(){
		List<UserLectureDomain> list = null;
		String loggedInUserId =SecurityContextHolder.getContext().getAuthentication().getName();
		
		try {
			list=ulDAO.selectMyLecQna(loggedInUserId);
			
			for(UserLectureDomain item : list) {
				if ("Y".equals(item.getQ_status())) {
	                item.setQ_status("완료");
	            } else if ("N".equals(item.getQ_status())) {
	                item.setQ_status("대기중");
	            }
			}
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchInstNotice
	
	
	/**
	 * 최대 넘버
	 * @return
	 */
	public String searchMaxQVal() {
		String maxVal="";
		StringBuffer pre = new StringBuffer("Q_SUB");
		try {
			maxVal=ulDAO.selectMaxValue();
			int num=Integer.parseInt(maxVal.substring(6))+1;
			String nextVal=String.format("%05d", num);
			pre.append(nextVal);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return pre.toString();
	}
	
	/**
	 * 강의 문의 작성
	 * @param uqVO
	 * @return
	 */
	public int addSubQ(UserQnaVO uqVO) {
		int cnt = 0;
        try {
        	cnt = ulDAO.insertSubQuestion(uqVO);
        } catch (PersistenceException Pe) {
        	Pe.printStackTrace();
        }
        return cnt;
	}
	
	
	public List<UserLectureDomain> searchPopLecture(){
		List<UserLectureDomain> list = null;
		try {
			list=ulDAO.selectPopLecture();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchInstNotice
	
	public List<UserLectureDomain> searchLatestLecture(){
		List<UserLectureDomain> list = null;
		try {
			list=ulDAO.selectLatestLecture();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchInstNotice
	
	public int addApplySub(UserApplySubVO uaVO) {
		int cnt = 0;
        try {
        	cnt = ulDAO.insertApplySubject(uaVO);
        } catch (PersistenceException Pe) {
        	Pe.printStackTrace();
        }
//        System.out.println("==============================uaVO======================="+uaVO);
        return cnt;
	}
	
	public int applyBtnControl(Map<String, String> info) {
	    int cnt = 0;
	    try {
	        cnt = ulDAO.selectRegCourse(info);
	    } catch (PersistenceException Pe) {
	        Pe.printStackTrace();
	    }
	    return cnt;
	}
	
	
	/**
	 * 모든 카테고리
	 * @return
	 */
	public String searchCategoryList() {
		List<UserLectureDomain> list = null;
		JSONObject jsonObj = new JSONObject();
		try {
			list = ulDAO.selectAllCategory();

			JSONArray jsonArr = new JSONArray();
			JSONObject jsonTemp = null;
			for (UserLectureDomain temp : list) {
				jsonTemp = new JSONObject();
				jsonTemp.put("cat_code", temp.getCat_code());
				jsonTemp.put("cat_name", temp.getCat_name());
				jsonArr.add(jsonTemp);

			}
			jsonObj.put("list", jsonArr);

		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return jsonObj.toJSONString();

	}
	
	/**
	 * 하위 카테고리
	 * @param cat_code
	 * @return
	 */
	public String searchSubCategoryList(String cat_code) {
		List<UserLectureDomain> list = null;
		JSONObject jsonObj = new JSONObject();
		try {
			list = ulDAO.selectSubCategory(cat_code);
			JSONArray jsonArr = new JSONArray();
			JSONObject jsonTemp = null;
			for (UserLectureDomain temp : list) {
				jsonTemp = new JSONObject();
				jsonTemp.put("cat_code", temp.getCat_code());
				jsonTemp.put("cat_name", temp.getCat_name());
				jsonArr.add(jsonTemp);
			}
			jsonObj.put("list", jsonArr);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return jsonObj.toJSONString();

	}

	
	
	
	
	
	
}//class
