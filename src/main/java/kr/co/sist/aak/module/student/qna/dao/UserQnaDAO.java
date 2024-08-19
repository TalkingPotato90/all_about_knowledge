package kr.co.sist.aak.module.student.qna.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.aak.domain.student.UserNoticeDomain;
import kr.co.sist.aak.domain.student.UserQnaDomain;
import kr.co.sist.aak.domain.student.vo.UserQnaVO;
import kr.co.sist.aak.util.MybatisDAO;

@Component
public class UserQnaDAO {

	private UserQnaDAO() {

	}

	/**
	 * 사이트 문의사항 나의 리스트
	 * 
	 * @return
	 */
	public List<UserQnaDomain> selectAllSiteQna(String std_id) throws PersistenceException {
		List<UserQnaDomain> list = null;
		
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.aak.student2.selectSiteNoticeQnaList",std_id);
		mbDAO.closeHanlder(ss);
		return list;
		
	}// selectAllUserNotice
	
	

	/**
	 * 문의사항 질문 상세
	 * 
	 * @param title
	 * @return
	 * @throws PersistenceException
	 */
	public UserQnaDomain selectOneSiteQ(String qna_no) throws PersistenceException {
		UserQnaDomain uqDomain = null;

		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		try {
			uqDomain = ss.selectOne("kr.co.sist.aak.student2.selectOneUserNoticeQ", qna_no);
		} finally {
			mbDAO.closeHanlder(ss);
		}
		return uqDomain;

	}

	/**
	 * 답변 상세
	 * 
	 * @param title
	 * @return
	 * @throws PersistenceException
	 */
	public UserQnaDomain selectOneSiteA(String qna_no) throws PersistenceException {
		UserQnaDomain uqDomain = null;

		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		try {
			uqDomain = ss.selectOne("kr.co.sist.aak.student2.selectOneUserNoticeA", qna_no);
		} finally {
			mbDAO.closeHanlder(ss);
		}
		return uqDomain;

	}

	/**
	 * 문의 넘버 최대 값 불러오기
	 * 
	 * @return
	 * @throws PersistenceException
	 */
	public String selectMaxValue() throws PersistenceException {
		String qna_no = null;

		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		qna_no = ss.selectOne("kr.co.sist.aak.student2.selectSiteQMaxval");
		mbDAO.closeHanlder(ss);
		System.out.println("==================================================qna_no===" + qna_no);
		return qna_no;
	}

	/**
	 * 문의사항 수정
	 * @param uqVO
	 * @return
	 * @throws PersistenceException
	 */
	public int insertSiteQuestion(UserQnaVO uqVO) throws PersistenceException {
		int cnt = 0;
		int cnt2 = 0;
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);

		cnt = ss.insert("kr.co.sist.aak.student2.insertSiteQuestion", uqVO);
		cnt2 = ss.insert("kr.co.sist.aak.student2.insertSiteAnsNo",uqVO );
		if (cnt == 1) {
			ss.commit();
		}
		mbDAO.closeHanlder(ss);
		System.out.println("===============cnt==================" + cnt);
		System.out.println("===============cnt2==================" + cnt2);
		return cnt+cnt2;
	}
	
	
	/**
	 * 사이트 문의 수정
	 * @param uqVO
	 * @return
	 * @throws PersistenceException
	 */
	public int updateSiteQuestion(UserQnaVO uqVO) throws PersistenceException {
		int cnt = 0;
		MybatisDAO mbDAO = MybatisDAO.getInstance();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		cnt = ss.insert("kr.co.sist.aak.student2.updateSiteQuestion", uqVO);
		if (cnt == 1) {
			ss.commit();
		}
		mbDAO.closeHanlder(ss);
		System.out.println("===============cnt==================" + cnt);
		return cnt;
	}

//	public int insertSiteQuestion(UserQnaVO uqVO) throws PersistenceException {
//		int cnt = 0;
//		int cnt2 = 0;
//		MybatisDAO mbDAO = MybatisDAO.getInstance();
//		SqlSession ss = mbDAO.getMyBatisHandler(false);
//		
//		cnt = ss.insert("kr.co.sist.aak.student2.insertSiteQuestion", uqVO);
//		cnt2 = ss.insert("kr.co.sist.aak.student2.insertSiteAnsNo",uqVO );
//		if (cnt == 1) {
//			ss.commit();
//		}
//		mbDAO.closeHanlder(ss);
//		System.out.println("===============cnt==================" + cnt);
//		System.out.println("===============cnt2==================" + cnt2);
//		return cnt+cnt2;
//	}
	

}
