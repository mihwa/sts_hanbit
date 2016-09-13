<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row" style="margin-top: 30px">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img id="img_1">
      <div class="caption">
        <h3>회원관리</h3>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </p>
      </div>
    </div>
  </div>
    <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img  id="img_2">
      <div class="caption">
        <h3>성적관리</h3>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </p>
      </div>
    </div>
  </div>
    <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img  id="img_3">
      <div class="caption">
        <h3>계좌관리</h3>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </p>
      </div>
    </div>
  </div>
</div>
<script>
$(function(){
	$('#admin_content #img_1').attr('src',app.img()+'/default/member_mgmt.jpg');
	$('#admin_content #img_2').attr('src',app.img()+'/default/grade_mgmt.jpg');
	$('#admin_content #img_3').attr('src',app.img()+'/default/account_mgmt.jpg');
});
</script>