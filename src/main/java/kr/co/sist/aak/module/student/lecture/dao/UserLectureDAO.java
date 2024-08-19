package kr.co.sist.aak.module.student.lecture.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.aak.domain.student.UserLectureDomain;
import kr.co.sist.aak.domain.student.vo.UserApplySubVO;
import kr.co.sist.aak.domain.student.vo.UserQnaVO;
import kr.co.sist.aak.util.MybatisDAO;

/**
 * @author user
 *
 */
@Component
public class UserLectureDAO {

	private UserLectureDAO() {
		
	}
	
	/**
	 * 사용자 강의 리스트
	 * @return
	 */
	public List<UserLectureDomain> selectAllUserLecture(){
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO=MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list=ss.selectList("kr.co.sist.aak.student3.selectAllUserLecture");
		mbDAO.closeHanlder(ss);
		return list;
	}
	
	
	/**
	 * 강의 상세
	 * @param sub_title
	 * @return
	 */
	public UserLectureDomain selectOneUserLecture(String sub_code){
		UserLectureDomain ulDomain = null;
		
		MybatisDAO mbDAO=MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		try {
			ulDomain=ss.selectOne("kr.co.sist.aak.student3.selectOneUserLecture", sub_code);
		}finally {
			mbDAO.closeHanlder(ss);
		}
		return ulDomain;
	}
	
	/**
	 * 수강생 수
	 * @param sub_code
	 * @return
	 */
	public UserLectureDomain selectStdCnt(String sub_code){
		UserLectureDomain ulDomain = null;
		
		MybatisDAO mbDAO=MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		try {
			ulDomain=ss.selectOne("kr.co.sist.aak.student3.selectOneStdCnt", sub_code);
		}finally {
			mbDAO.closeHanlder(ss);
		}
		return ulDomain;
	}
	
	
	/**
	 * 상하위카테고리명
	 * @param sub_code
	 * @return
	 */
	public UserLectureDomain selectCatSubName(String sub_code){
		UserLectureDomain ulDomain = null;
		
		MybatisDAO mbDAO=MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		try {
			ulDomain=ss.selectOne("kr.co.sist.aak.student3.selectCatWithSubCode", sub_code);
		}finally {
			mbDAO.closeHanlder(ss);
		}
		return ulDomain;
	}
	
	/**
	 * 강사 공지 리스트
	 * @param title
	 * @return
	 */
	public List<UserLectureDomain> selectAllInstNotice(String sub_code){
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectAllInstNotice", sub_code);
		mbDAO.closeHanlder(ss);
		return list;
		
	}//selectAllInstNotice
	
	
	/**
	 * 강의 목차 리스트
	 * @param sub_code
	 * @return
	 */
	public List<UserLectureDomain> selectAllLecture(String sub_code){
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectAllLecture", sub_code);
		mbDAO.closeHanlder(ss);
		return list;
		
	}//selectAllLecture
	
	/**
	 * 강의 qna 리스트
	 * @param sub_code
	 * @return
	 */
	public List<UserLectureDomain> selectAllLecQna(String sub_code){
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectAllLecQna", sub_code);
		mbDAO.closeHanlder(ss);
		return list;
	}//selectAllLecture
	
	/**
	 * 강의 qna 나의 리스트
	 * @param sub_code
	 * @return
	 */
	public List<UserLectureDomain> selectMyLecQna(String Q_std_id){
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectAllMySubQuestion", Q_std_id);
		mbDAO.closeHanlder(ss);
		return list;
	}//selectAllLecture
	
	/**
	 * 문의 넘버 최대 값 불러오기
	 * 
	 * @return
	 * @throws PersistenceException
	 */
	public String selectMaxValue() throws PersistenceException {
		String s_qna_no = null;

		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		s_qna_no = ss.selectOne("kr.co.sist.aak.student3.selectSubQMaxval");
		mbDAO.closeHanlder(ss);
		System.out.println("==================================================qna_no===" + s_qna_no);
		return s_qna_no;
	}

	public int insertSubQuestion(UserQnaVO uqVO) throws PersistenceException {
		int cnt = 0;
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);

		cnt = ss.insert("kr.co.sist.aak.student3.insertSubQuestion", uqVO);
		if (cnt == 1) {
			ss.commit();
		}
		mbDAO.closeHanlder(ss);
		System.out.println("===============cnt==================" + cnt);
		
		return cnt;
	}
	
	
	/**
	 * 인기강좌 상위 5개
	 * @param sub_code
	 * @return
	 */
	public List<UserLectureDomain> selectPopLecture(){
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectSubcodePop");
		mbDAO.closeHanlder(ss);
		return list;
	}
	
	/**
	 * 최신강좌 상위 3개
	 * @return
	 */
	public List<UserLectureDomain> selectLatestLecture(){
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectLatestSub");
		mbDAO.closeHanlder(ss);
		return list;
	}
	
	/**
	 * 수강신청
	 * @param uaVO
	 * @return
	 * @throws PersistenceException
	 */
	public int insertApplySubject(UserApplySubVO uaVO) throws PersistenceException {
		int cnt = 0;
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);

		cnt = ss.insert("kr.co.sist.aak.student3.insertApplySub", uaVO);
		if (cnt == 1) {
			ss.commit();
		}
		mbDAO.closeHanlder(ss);
//		System.out.println("===============cnt==================" + cnt);
		return cnt;
	}
	
	public List<UserLectureDomain> selectCatLecture(String cat_code){
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectCatLecture", cat_code);
		mbDAO.closeHanlder(ss);
		return list;
		
	}//selectAllLecture
	
	public int selectRegCourse(Map<String, String> info) {
	    int result = 0;
	    
	    MybatisDAO mbDAO = MybatisDAO.getInstance();
	    SqlSession ss = mbDAO.getMyBatisHandler(false);
	    
	    result = ss.selectOne("kr.co.sist.aak.student3.selectRegCourse", info);
	    
	    return result;
	}
	
	
//	public List<UserLectureDomain> selectLecturesByCategory(String category){
//		List<UserLectureDomain> list = null;
//		
//		MybatisDAO mbDAO = MybatisDAO.getInstance();
//		SqlSession ss = mbDAO.getMyBatisHandler(false);
//		
//		list = ss.selectList("kr.co.sist.aak.student3.selectLecturesByCategory", category);
//		mbDAO.closeHanlder(ss);
//		return list;
//		
//	}//selectAllLecture
//	
//	public List<UserLectureDomain> selectSubCategories(String category){
//		List<UserLectureDomain> list = null;
//		
//		MybatisDAO mbDAO = MybatisDAO.getInstance();
//		SqlSession ss = mbDAO.getMyBatisHandler(false);
//		
//		list = ss.selectList("kr.co.sist.aak.student3.selectSubCategories", category);
//		mbDAO.closeHanlder(ss);
//		return list;
//		
//	}//selectAllLecture
	
	
	
	/**
	 * 상위 카테고리
	 * @return
	 * @throws PersistenceException
	 */
	public List<UserLectureDomain> selectAllCategory()throws PersistenceException{
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectAllCategory");
		mbDAO.closeHanlder(ss);
		return list;
		
	}//selectPrimeCategory 
	
	
	/**
	 * 하위 카테고리
	 * @param cat_code
	 * @return
	 * @throws PersistenceException
	 */
	public List<UserLectureDomain> selectSubCategory(String cat_code) throws PersistenceException{
		List<UserLectureDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student3.selectSubCat", cat_code);
		mbDAO.closeHanlder(ss);
		return list;
	}//selectSubtitle
	
	
}//class
