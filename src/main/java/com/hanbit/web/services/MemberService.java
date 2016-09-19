package com.hanbit.web.services;

import com.hanbit.web.domains.Command;
import com.hanbit.web.domains.MemberDTO;



public interface MemberService{
	public String regist(MemberDTO mem);
	public MemberDTO findOne(Command command);
	public void update(MemberDTO stu2);
	public void delete(MemberDTO member);
	public void logout(MemberDTO member);
	public int count();
	public MemberDTO show();
	public MemberDTO login(MemberDTO member);
	
}