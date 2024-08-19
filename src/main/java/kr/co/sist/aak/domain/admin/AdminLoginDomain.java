package kr.co.sist.aak.domain.admin;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminLoginDomain {
	private String id,password,auth;

	public AdminLoginDomain() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminLoginDomain(String id, String password, String auth) {
		super();
		this.id = id;
		this.password = password;
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "AdminLoginDomain [id=" + id + ", password=" + password + ", auth=" + auth + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
}
