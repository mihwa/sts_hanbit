<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	div.memberClass{font-size: 20px}
</style>
<div id="" class="memberClass box">
	
	<h1>계좌관리</h1>
	<div style="width: 300px;margin: 0 auto;text-align: left;">
	<ol>
		<li><a href="${context}/account.do?page=regist&action=regist">개설</a></li>
		<li><a href="${context}/account.do?page=deposit&action=deposit">입금</a></li>
		<li><a href="${context}/account.do?page=withdraw&action=withdraw">출금</a></li>
		<li><a href="${context}/account.do?page=update&action=update">비번수정 </a></li>
		<li><a href="${context}/account.do?page=delete&action=delete">해지</a></li>
		<li><a href="${context}/account.do?page=list&action=list">목록 </a></li>
		<li><a href="${context}/account.do?page=search&action=search">조회 </a></li>
		<li><a href="${context}/account.do?page=count&action=count">통장수</a></li>
	</ol>
	</div>
	<a href="${context }/global/main.jsp"><img src="${img }/home.jpg" alt="home" style="width: 30px"/>
	</a>
</div>


