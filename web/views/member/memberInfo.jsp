<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#infoTable{margin: auto;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<h1 align="center">내 정보 보기</h1>
	<form action="${ contextPath }/views/member/memberUpdateForm.jsp" method="post">
		<table id="infoTable">
			<tr>
				<td width="100px">* 아이디</td>
				<td>${member.userId}<input type="hidden" name="userId" value="${member.userId}"></td>
			</tr>
			<tr>
				<td>* 이름</td>
				<td>${member.userName}<input type="hidden" name="userName" value="${member.userName}">
			</td>
			</tr>
			
			<tr>
				<td>* 닉네임</td>
				<td>${member.nickName}<input type="hidden" name="nickName" value="${member.nickName}">
			</td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;이메일</td>
				<td>${member.email}<input type="hidden" name="email" value="${member.email}"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;생년월일</td>
				<td>${member.birthDay}<input type="hidden" name="birth" value="${member.birthDay}"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;전화번호</td>
				<td>${member.phone}<input type="hidden" name="phone" value="${member.phone}"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;주소</td>
				<td>${member.address}<input type="hidden" name="address" value="${member.address}"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;성별</td>
				<td><%-- <c:if test="${member.gender =='M'}" >
				남자
				</c:if>
				<c:if test="${member.gender == 'F'}" >
				여자
				</c:if>
				 --%>
				 
				 <input type="hidden" name="gender" value="${member.gender}">
				<c:choose>
				<c:when test="${member.gender =='M'}">남자</c:when>
				<c:otherwise>
				여자
				</c:otherwise>
				</c:choose>
				
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center">
						<br>
						<button type="button" onclick="location.href='${ contextPath }/views/member/memberPwdUpdateForm.jsp'">비밀번호 변경</button>
						<input type="submit" value="내 정보 수정">
						<button type="button" onclick="deleteMember();">회원 탈퇴</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
	
	 	function deleteMember(){
	 		
	 		var bool = confirm("정말 탈퇴하시겠습니까?");
	 		
	 		if(bool){
	 			location.href="mdelete.me";
	 		}
	 	}
	
	</script>
</body>
</html>