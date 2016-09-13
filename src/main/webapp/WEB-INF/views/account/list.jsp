<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#account_list_table {font-family: arial, sans-serif;border-collapse: collapse;width: 100%;}
#account_list_table td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

#account_list_table tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<div class="box" style='padding-top:0;width:90%'>
<ul class="list-group">
  <li class="list-group-item">총계좌수 : 120 개</li>
</ul>
		<div class="panel panel-primary">
  <div class="panel-heading">계좌리스트</div>
<table id="account_list_table">
  <tr>
     <th>계좌번호</th>
	 <th>이 름</th>
	 <th>생년월일</th>
	 <th>잔액</th>
	
  </tr>
  <tr>
    <td>123-456-789</td>
    <td><a class="name">홍길동</a></td>
    <td>1980년10월2일</td>
    <td>￦300</td>  
   
  </tr>
  <tr>
   <td>123-456-789</td>
    <td><a class="name">김유신</a></td>
    <td>1980년10월2일</td>
    <td>￦300</td>  
   
  </tr>
  <tr>
   <td>123-456-789</td>
    <td><a class="name">유관순</a></td>
     <td>1980년10월2일</td>
    <td>￦300</td>  
  </tr>
  
</table>
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
	</div>
<script type="text/javascript">
$(function(){
	$('#member_list_table .name').click(function(){controller.moveWithKey('member','detail','hong');});
	$('#member_list_table .regist').click(function(){controller.moveWithKey('grade','regist','hong');});
	$('#member_list_table .regist').click(function(){controller.moveWithKey('grade','update','hong');});
});

</script>