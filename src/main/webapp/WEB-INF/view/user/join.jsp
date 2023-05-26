<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.join--all--wrap {
	display: flex;
	flex-direction: column;
}
</style>

<main>
	<div>
		<h1>회원가입</h1>
		<form action="/joinProc" method="post">
			<div class="join--all--wrap">
				<c:choose>
					<%-- 일반 회원가입 --%>
					<c:when test="${id==null}">
						아이디 <input type="text" name="id">
						<c:if test="${key != null}">
							${key}
						</c:if>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${joinFormDto != null}">
						비밀번호 <input type="password" name="password" required="required">
						비밀번호 확인 <input type="password" required="required">
					</c:when>
					<c:otherwise>
						비밀번호 <input type="password" name="password" required="required">
						비밀번호 확인 <input type="password" required="required">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${joinFormDto != null}">
				한국 이름 <input type="text" name="korName" required="required">
					</c:when>
					<c:otherwise>
				한국 이름 <input type="text" name="korName" required="required">
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${joinFormDto != null}">
				영어 이름 <input type="text" name="engName" required="required">
					</c:when>
					<c:otherwise>
				영어 이름 <input type="text" name="engName" required="required">
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${joinFormDto != null}">
				생년월일 <input type="text" id="datepicker" name="birthDate" required="required">
					</c:when>
					<c:otherwise>
				생년월일 <input type="text" id="datepicker" name="birthDate" required="required">
					</c:otherwise>
				</c:choose>

				<div>
					<c:choose>
						<c:when test="${joinFormDto != null}">
								성별 <label> <input type="hidden" name="gender" value="${gender}" required="required"> 남
							</label>
							<label> <input type="hidden" name="gender" value="${gender}" required="required"> 여
							</label>
						</c:when>
						<c:otherwise>
								성별 <label> <input type="hidden" name="gender" value="${gender}" required="required"> 남
							</label>
							<label> <input type="hidden" name="gender" value="${gender}" required="required"> 여
							</label>
						</c:otherwise>
					</c:choose>

				</div>
				<c:choose>
					<c:when test="${joinFormDto != null}">
				휴대전화 <input type="text" name="phoneNumber" placeholder="예:010-0000-0000" required="required">
					</c:when>
					<c:otherwise>
				휴대전화 <input type="text" name="phoneNumber" placeholder="예:010-0000-0000" required="required">
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${joinFormDto != null}">
						이메일 <input type="text" name="email" value="${email}" required="required">
					</c:when>
					<c:otherwise>
						이메일 <input type="text" name="email" value="${email}" required="required">
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${joinFormDto != null}">
				주소 <input type="text" name="address" required="required" value="부산시">
					</c:when>
					<c:otherwise>
				주소 <input type="text" name="address" required="required" value="부산시">
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${joinFormDto != null}">
						국적 <select name="nationality" required="required">
							<c:forEach var="countryNm" items="${countryNm}">
								<option value="${countryNm}" <c:if test="${countryNm.equals(\'대한민국\')}"> selected </c:if>>${countryNm}</option>
							</c:forEach>
						</select>
					</c:when>
					<c:otherwise>
						국적 <select name="nationality" required="required">
							<c:forEach var="countryNm" items="${countryNm}">
								<option value="${countryNm}" <c:if test="${countryNm.equals(\'대한민국\')}"> selected </c:if>>${countryNm}</option>
							</c:forEach>
						</select>
					</c:otherwise>
				</c:choose>


				<input type="hidden" name="grade">
				<button type="submit" class="btn btn-primary">회원가입</button>
				<button type="button" onclick="location.href='/'" class="btn btn-danger">취소</button>
			</div>
		</form>
	</div>

	<script>
		$(function() {
			/* console.log(dateString2); */

			$("#datepicker").datepicker(
					{
						dateFormat : "yy-mm-dd",
						changeMonth : true,
						changeYear : true,
						yearRange : '1900:2023',
						onSelect : function() {
							let date = $.datepicker.formatDate("yy-mm-dd", $(
									"#datepicker").datepicker("getDate"));
						}
					});

		});
	</script>
</main>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>