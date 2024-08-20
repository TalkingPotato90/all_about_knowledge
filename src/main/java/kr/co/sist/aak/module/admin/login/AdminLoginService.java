package kr.co.sist.aak.module.admin.login;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.stereotype.Service;

import kr.co.sist.aak.domain.admin.AdminLoginDomain;
import kr.co.sist.aak.domain.admin.AdminPermissionDomain;
import kr.co.sist.aak.domain.admin.vo.AdminLoginVO;
@Service
public class AdminLoginService {
	@Autowired(required = false)
	private AdminLoginDAO adlDAO;
	
	public boolean searchLogin(AdminLoginVO alVO) {
		AdminLoginDomain adld = new AdminLoginDomain();
		String plain ="";
		try {
			String key = "bys190";
			String salt = "19911031";
			TextEncryptor te = Encryptors.text(key, salt);
			adld = adlDAO.selectAdminPass(alVO);
			plain =te.decrypt(adld.getPassword());
		}catch (PersistenceException | NullPointerException b) {
			b.printStackTrace();
		}
		return adld!= null&& plain.equals(alVO.getPassword());
		
	}
	
	public AdminPermissionDomain searchAdminPermission(AdminLoginVO alVO) {
		AdminPermissionDomain ald = null;
		try {
			ald = adlDAO.selectAdminPermission(alVO);
			StringBuilder sb = new StringBuilder();
			if(ald.getInstructor_management().equals("Y")) {
				sb.append("<br/>");
			}
			if(ald.getNotice_management().equals("Y")) {
				sb.append("<br/>");
			}
			if(ald.getMember_management().equals("Y")) {
				sb.append("<br/>");
			}
			if(ald.getCategory_management().equals("Y")) {
				sb.append(" <br/>");
			}
			if(ald.getQna_management().equals("Y")) {
				sb.append("<br/>");
			}
//			sb.deleteCharAt(sb.lastIndexOf(" <br/> "));
			ald.setPermissions(sb.toString());
			
		}catch (PersistenceException e) {
			e.printStackTrace();
		}
		return ald;
	}
	public String searchAuth(AdminLoginVO alVO) {
		AdminLoginDomain adld = null;
		try {
			adld = adlDAO.selectAdminPass(alVO);
		}catch (PersistenceException e) {
			e.printStackTrace();
		}
		
		
		return adld.getAuth();
	}
}
