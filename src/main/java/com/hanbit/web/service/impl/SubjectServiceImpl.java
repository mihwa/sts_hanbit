package com.hanbit.web.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hanbit.web.domains.SubjectDTO;
import com.hanbit.web.services.SubjectService;

@Service
@Transactional
public class SubjectServiceImpl implements SubjectService{
	private static SubjectServiceImpl instance
		= new SubjectServiceImpl();
	private SubjectServiceImpl() {
		
	}
	public static SubjectServiceImpl getInstance() {
		return instance;
	}

	@Override
	public void insert(SubjectDTO s) {
	}
}