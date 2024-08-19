package kr.co.sist.aak.domain.student;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserLectureDomain {
	//강의리스트
	private String sub_code, intro, goal, status, image;
	private int total_no, total_time, comp_time;
	private Date create_date;
	private String sub_title, catCode,cat_code,cat_name,prime_cat_code,cat2;
	private String inst_id;
	
	//강의목차
	private String lec_code, lec_title, f_name, lec_explain;//title as lec_title
	private int time;
	
	//강의공지
	private String title,content, lec_status;
	private Date write_date;
	
	//강의문의
	private String qna_no, Question_title, Q_std_id, Q_content, 
	Q_lec_code, Q_status, ans_content,Q_subTitle,ans_id;//title as Q_title
	private Date q_date, ans_date; 
	private int cnt;
	
	//
}
