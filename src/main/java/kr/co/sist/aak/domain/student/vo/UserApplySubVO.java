package kr.co.sist.aak.domain.student.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserApplySubVO {
private String std_id, sub_code, apply; 
private char interest;
}
