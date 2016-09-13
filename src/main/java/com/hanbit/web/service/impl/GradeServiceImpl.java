package com.hanbit.web.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hanbit.web.domains.GradeDTO;
import com.hanbit.web.services.GradeService;
@Service
public class GradeServiceImpl implements GradeService {
	private static GradeServiceImpl instance = new GradeServiceImpl();
	public static GradeServiceImpl getInstance() {
		return instance;
	}
	private GradeServiceImpl() {}
	@Override
	public int insert(GradeDTO grade) {
		return 0;
	}

	@Override
	public void update(GradeDTO grade) {
		
	}

	@Override
	public String delete(String del) {
		String msg = "";
		return msg;
	}

	@Override
	public GradeDTO findBySeq(String seq) {
		return null;
	}

	@Override
	public int count(String examDate) {
		return 0;
	}
	@Override
	public void score(String[] a) {
		GradeDTO g = new GradeDTO();
		g.setId(a[0]);
		
		this.insert(g);
	}


}