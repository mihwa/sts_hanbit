package com.hanbit.web.domains;

import java.io.Serializable;

import org.junit.experimental.theories.DataPoint;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;


@Component


public class GradeDTO implements Serializable  {
	private static final long serialVersionUID = 1L;
	
	@Getter @Setter private int examSeq,subjSeq,gradeSeq,score,birth;
	@Getter @Setter private String subjName,grade,term,id,pw,name,regDate,ssn,email, profileImg,role,phone;


}
