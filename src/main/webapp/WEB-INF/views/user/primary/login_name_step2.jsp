<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="WEB-INF/tld/umt.tld" prefix="umt"%>
<fmt:setBundle basename="application" />
<umt:AppList/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><fmt:message key='sendActiveEmail.title'/></title>
		<link href="<%= request.getContextPath() %>/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
	</head>
	<body class="login">
		<jsp:include flush="true" page="/banner2013.jsp"></jsp:include>
			<div class="container login gray">
				<div class="processBarContainer">
	              <ul class="processBar">
	                  <li class="current">
	                  	<span class="step-num span1">1</span>
	                  	<span class="step-text em1">验证身份 </span> 
	                  </li>
	                  <li class="current">
	                  	<span class="step-num span2">2</span>
	                  	<span class="step-text em2">输入新账号</span>
	                  </li>
	                  <li class="">
	                  	<span class="step-num span3">3</span>
	                  	<span class="step-text em3">激活新账号</span>
	                  </li>
	                  <li class="">
	                  	<span class="step-num span4">4</span>
	                  	<span class="step-text em4">成功</span>
	                  </li>
	              </ul>
	            </div>
			<p class="hint">您将更改账号，修改成功后，原通行证账号将无法继续登录。 请输入新的通行证账号。</p>
			<form id="primaryForm" action="<umt:url value="/user/primary/loginName.do?act=savePrimaryEmail"/>" method="post">
				<table class="form_table">
				
				<tr>
					<th>
						当前主要电子邮件地址：
					</th>
					<td>${loginInfo.user.cstnetId }</td>
					<td></td>
				</tr>
				<tr>
					<th>
					       新主要电子邮件地址：
					</th>
					<td>
						<input name="primaryEmail" id="primaryEmail" type="text"/>
					</td>
					<td>
						<span id="primaryEmail_error_place" class="error">
							<c:if test="${!empty primaryEmail_error }">
								<fmt:message key='${primaryEmail_error }'/>
							</c:if>
						</span>
					</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="hidden" value="${loginInfo.user.cstnetId }" name="loginName"/>
					<button type="submit" class="btn long btn-primary">确定</button></td>
					<td></td>
				</tr>
			</table>
			
		</form>
		</div>
		<jsp:include flush="true" page="/bottom2013.jsp"></jsp:include>
		<script type="text/javascript">
		$(document).ready(function(){
			$('#primaryForm').validate({
					rules: {
						primaryEmail:{
							 required:true,
							 email:true,
							 remote:{
								 type: "GET",
								 url: '<umt:url value="/user/primary/loginName.do"/>',
								 data:{ 
									 'act':'isPrimaryEmailUsed',
									 "primaryEmail":function(){
														return $("#primaryEmail").val();
													}	   		
						  	 		 }
							 }
						 },
						 
					 },
					 messages: {
						 primaryEmail:{
							 required:"请输入新的主账户",
							 email:"<fmt:message key='regist.username.format'/>",
							 remote:'<fmt:message key="primaryEmail.used"/>'
						 }
					 },
					 errorPlacement: function(error, element){
						 var sub="_error_place";
						 var errorPlaceId="#"+$(element).attr("name")+sub;
						 	$(errorPlaceId).html("");
						 	error.appendTo($(errorPlaceId));
					 }
				});
		});
		</script>
	</body>
</html>