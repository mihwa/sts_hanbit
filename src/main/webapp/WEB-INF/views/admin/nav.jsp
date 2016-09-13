<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul id="admin_nav" class="nav nav-tabs" style='height:50px'>
  <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
     회원관리<span class="caret"></span>
    </a>
    <ul id="member_mgmt" class="dropdown-menu">
		<li><a id="list" >목 록</a></li>
		<li><a id="find">검 색</a></li>
		<li><a id="count" >학생수</a></li>
    </ul>
  </li>
  <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
      성적관리<span class="caret"></span>
    </a>
    <ul id="grade_mgmt" class="dropdown-menu">
    			<li><a  id="g_regist">등록</a></li>
				<li><a  id="g_update">수정</a></li>
				<li><a  id="g_list">목록</a></li>
				<li><a  id="g_count">카운트</a></li>
				<li><a  id="g_find">검색</a></li>   
    </ul>
  </li>
  <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
      계좌관리<span class="caret"></span>
    </a>
    <ul id="account_mgmt" class="dropdown-menu">
			<li><a id="list">목록 </a></li>
			<li><a id="find">조회 </a></li>
			<li><a id="count">통장수</a></li>
		 </ul>
  </li>
</ul>
<script type="text/javascript">
$(function(){
	$('#g_regist').click(function(){alert('등록하시려면 회원리스트로 이동해주세요');controlle})('height','50px');
	$('#g_regist').click(function(){alert('수정하시려면 회원리스트로 이동해주세요');controlle})('height','50px');
	$('#admin_nav').css('height','50px');
	$('#account_mgmt #list').click(function(){controller.move('account','list')}
	$('#account_mgmt #find').click(function(){controller.move('account','find')}
	$('#account_mgmt #count').click(function(){controller.move('account','count')}
});
</script>