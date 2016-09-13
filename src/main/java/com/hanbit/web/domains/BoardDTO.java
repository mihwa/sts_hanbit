package com.hanbit.web.domains;
import java.io.Serializable;

import org.junit.experimental.theories.DataPoints;
import org.springframework.stereotype.Component;

import com.hanbit.web.util.Constants;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Component
@Data
	public class BoardDTO implements Serializable{
	private static final long serialVersionUID=1L;
	
	@Getter @Setter private int artSeq;
	@Getter @Setter private String 
	category,title,writeDate,content,id,pw,name,gender,regDade,ssn,email,profileImg,role,phone;
	
}

