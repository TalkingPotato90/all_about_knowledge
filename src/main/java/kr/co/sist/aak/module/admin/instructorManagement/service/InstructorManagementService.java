package kr.co.sist.aak.module.admin.instructorManagement.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.aak.domain.admin.InstructorManagementDomain;
import kr.co.sist.aak.domain.admin.LectureManagementDomain;
import kr.co.sist.aak.domain.admin.vo.InstructorManagementVO;
import kr.co.sist.aak.module.admin.instructorManagement.dao.InstructorManagementDAO;
@Service
public class InstructorManagementService {
	@Autowired(required = false)
	private InstructorManagementDAO imDAO;
	
	public List<InstructorManagementDomain> searchAllInstructors(HashMap<String, Object> map) {
		List<InstructorManagementDomain> list =null;
		try {
			list = imDAO.selectInstructors(map);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	/**
	 * 강사중 삭제 플래그가 N(재직중)인 강사들의 리스트를 출력하는 method
	 * @return
	 */
	public List<InstructorManagementDomain> searchAllNInstructor() {
		List<InstructorManagementDomain> list =null;
		try {
			
			list = imDAO.selectAllNInstructor()	;
		
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}
	/**
	 * 강사중 삭제 플래그가 Y(퇴사 한)인 강사들의 리스트를 출력하는 method
	 * @return
	 */
	public List<InstructorManagementDomain> searchAllyInstructor() {
		List<InstructorManagementDomain> list =null;
		try {
			list = imDAO.selectAllYInstructor()	;
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	public InstructorManagementDomain instructorDetail(String inst_id){
		InstructorManagementDomain imd = null;
		try {
			imd = imDAO.selectOneInstructor(inst_id);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return imd;
	}
	public void addInstructor(InstructorManagementVO iVO) {
		try {
			imDAO.insertInstructor(iVO);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
	}
	public String searchMaxInstId() {
		String maxId = "";
		
	StringBuffer pre = new StringBuffer("INST_");
	
		try {
			maxId =imDAO.selectMaxInstId();
			int num = Integer.parseInt(maxId.substring(6))+1;
			String nextnum = String.format("%05d",num);
			pre.append(nextnum);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return pre.toString();
	}
	public int modifyInstructorInfo(InstructorManagementVO iVO) {
		int cnt =0;
		
		try {
			imDAO.updateInstructor(iVO);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}
	public int removeInstructor(String inst_id) {
		int cnt =0;
		try {
			
			imDAO.deleteInstructor(inst_id);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return cnt;
	}
	public List<String> searchInstructorSubject(String inst_id) {
		List<String> list = null;
		try {
			list = imDAO.selectInstructorSubject(inst_id);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}
	public String searchInstructorSubjectPercentage(){
		 List<InstructorManagementDomain> list =null;
		 JSONObject jsonObj = new JSONObject();
		 try {
			 list = imDAO.selectInstructorSubjectPercentage();
			 JSONArray jsonArr = new JSONArray();
			 JSONObject jsonTemp = null;
		for(InstructorManagementDomain temp :list) {
			jsonTemp = new JSONObject();
			jsonTemp.put("major_subject", temp.getMajor_subject());
			jsonTemp.put("subject_count", temp.getSubject_count());
			jsonTemp.put("percentage",String.format("%.2f", temp.getPercentage()));
			jsonArr.add(jsonTemp);
			
		}
		jsonObj.put("list", jsonArr);
		 }catch (PersistenceException e) {
			 e.printStackTrace();
		}
		 return jsonObj.toJSONString();
	}
	public String searchNYInstructor() {
		int n =0;
		int y =0;
		JSONObject jsonObj = new JSONObject();
		try {
			n = imDAO.selectInstructorNCount();
			y = imDAO.selectInstructorYCount();
			jsonObj.put("n", n);
			jsonObj.put("y", y);
		}catch (PersistenceException e) {
			e.printStackTrace();
		}
		return jsonObj.toJSONString();
	}
}
