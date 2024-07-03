package kr.co.sist.aak.domain.admin;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class AdminPermissionDomain {
	private String id ,notice_management, member_management, category_management, instructor_management, qna_management;

	public AdminPermissionDomain(String id, String notice_management, String member_management,
			String category_management, String instructor_management, String qna_management) {
		super();
		this.id = id;
		this.notice_management = notice_management;
		this.member_management = member_management;
		this.category_management = category_management;
		this.instructor_management = instructor_management;
		this.qna_management = qna_management;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNotice_management() {
		return notice_management;
	}

	public void setNotice_management(String notice_management) {
		this.notice_management = notice_management;
	}

	public String getMember_management() {
		return member_management;
	}

	public void setMember_management(String member_management) {
		this.member_management = member_management;
	}

	public String getCategory_management() {
		return category_management;
	}

	public void setCategory_management(String category_management) {
		this.category_management = category_management;
	}

	public String getInstructor_management() {
		return instructor_management;
	}

	public void setInstructor_management(String instructor_management) {
		this.instructor_management = instructor_management;
	}

	public String getQna_management() {
		return qna_management;
	}

	public void setQna_management(String qna_management) {
		this.qna_management = qna_management;
	}

}
