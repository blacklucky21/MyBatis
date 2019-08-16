<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<h1 align="center">내 정보 수정</h1>
	<form action="${ contextPath }/mupdate.me" method="post">
	<table id="infoTable">
			<tr>
				<td>* 아이디</td>
				<td><input type="text" name="userId" value="${param.userId}" readonly></td>
			</tr>
			<tr>
				<td>* 비밀번호</td>
				<td><input type="password" name="userPwd" value="${member.userPwd}"></td>
			</tr>
			<tr>
				<td>* 비밀번호 확인</td>
				<td><input type="password" name="userPwd2" value="${member.userPwd }" ></td>
			</tr>
			<tr>
				<td>* 이름</td>
				<td><input type="text" name="userName" value="${param.userName}" ></td>
			</tr>
			<tr>
				<td>* 닉네임</td>
				<td><input type="text" name="nickName" value="${param.nickName }"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;이메일</td>
				<td><input type="email" name="email" value="${param.email}"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;생일</td>
				<td>
					<select name="year">
						<c:forEach begin="<%= new GregorianCalendar().get(Calendar.YEAR) - 100 %>" end="<%= new GregorianCalendar().get(Calendar.YEAR) %>" var="i">
							<c:if test="${fn:substring(param.birth,0,4)==i }">
								<option value= "${i}" selected >${i}</option>
							</c:if>
							<c:if test="${fn:substring(param.birth,0,4)!=i }">
							<option value="${ i }">${ i }</option>
							</c:if>
						</c:forEach>
					</select>
					<select name="month">
						<c:forEach begin="1" end="12" var="i">
						
						<c:if test="${ fn:substring(param.birth,5,7)==i }">
								<option value= "${i}" selected >${i}</option>
							</c:if>
							<c:if test="${ fn:substring(param.birth,5,7)!=i }">
							<option value="${ i }">${ i }</option>
							</c:if>
						</c:forEach>
					</select>
					<select name="date">
						<c:forEach begin="1" end="31" var="i">
							<c:if test="${ fn:substring(param.birth,8,10)==i }">
								<option value= "${i}" selected >${i}</option>
							</c:if>
							
							<c:if test="${ fn:substring(param.birth,8,10)!=i }">
							<option value="${ i }">${ i }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;전화번호</td>
				<td><input type="text" name="phone" value="${param.phone}"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;주소</td>
				<td><input type="text" name="address" value="${param.address}"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;성별</td>
				<td>
				
				
					<input type="radio" name="gender" value="M" ${param.gender eq  'M' ? "checked" : ""}>남자 &nbsp;&nbsp;
					<input type="radio" name="gender" value="F" ${param.gender eq  'F' ? "checked" : ""}>여자
				
			<%-- 	 <input type="radio" name="gender" value="M" <c:if test="${ param.gender == 'M' }">checked</c:if>>남자 &nbsp;&nbsp;
               <input type="radio" name="gender" value="F" <c:if test="${ param.gender == 'F' }">checked</c:if>>여자
 --%>
			
				</td>
			</tr>
		<tr>
				<td colspan="2">
					<div align="center">
						<br>
						<input type="submit" value="수정">
						<button type="reset">취소</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>