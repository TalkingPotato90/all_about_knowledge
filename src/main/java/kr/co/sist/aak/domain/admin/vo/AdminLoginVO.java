package kr.co.sist.aak.domain.admin.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminLoginVO {
	private String id,password;

	public AdminLoginVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminLoginVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	@Override
	public String toString() {
		return "AdminLoginVO [id=" + id + ", password=" + password + "]";
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
	
}
