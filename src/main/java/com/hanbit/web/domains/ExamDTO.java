package com.hanbit.web.domains;
import java.io.Serializable;

import org.springframework.stereotype.Component;

import com.hanbit.web.util.Constants;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Component
@Data
	public class ExamDTO implements Serializable{
	private static final long serialVersionUID=1L;

	@Getter @Setter private int examSeq,score,subjsqe;
	@Getter @Setter private String term,id;
	
}

