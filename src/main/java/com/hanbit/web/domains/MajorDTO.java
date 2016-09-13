package com.hanbit.web.domains;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;



@Component
@Data
public class MajorDTO implements Serializable{
		private static final long serialVersionUID=1L;

		@Getter @Setter private int MajorSeq;
		@Getter @Setter private String MajorTitle,grade,term,id,pw,name,regDate,gender,ssn,email,profileImg,role,phone;

}
