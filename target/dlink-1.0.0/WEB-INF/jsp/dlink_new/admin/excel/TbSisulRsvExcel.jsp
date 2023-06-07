<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Excel Download</title>
</head>
<%
	String filename = "시설예약관리";

	filename = URLEncoder.encode(filename, "UTF-8");
	
	response.setHeader("Content-type", "application/vnd.ms-excel; charset=utf-8");
	response.setHeader("Content-Disposition","attachment; filename=\"" + filename + ".xls" + "\"");
%>
<body>
	<table  border="1">
		<colgroup>
			<col width="100px">
			<col width="200px">
			<col width="300px">
			<col width="100px">
			<col width="100px">
			
			<col width="300px">
			<col width="200px">
			<col width="200px">
			<col width="200px">
			<col width="200px">
			
			<col width="200px">			
			<col width="100px">			
			<col width="100px">
			<col width="200px">
		</colgroup>
		<thead>
		    <tr>
				<th>업체명</th>
				<th>제목</th>
				<th>예약일자</th>
				<th>이용시간</th>
				<th>촬영품개수</th>
				<th>촬영제품</th>
				<th>촬영품크기</th>
				<th>촬영반사유무</th>
				<th>촬영목적</th>
				<th>중소상공인확인서 파일첨부</th>
				<th>제품사진 파일첨부</th>
				<th>처리상태</th>
				<th>반려사유</th>
		    </tr>
		</thead>
		<tbody>
				<tr>
					<td>${result.comNm}</td>
					<td>${result.title }</td>
					<td>${result.rsvYear}.${result.rsvMonth}.${result.rsvDay}</td>
					<td>${result.rsvSt}:00 ~ ${result.rsvEt}:00</td>
					<td>${result.prodCnt}</td>
					<td>${result.prod1}</td>
					<td>${result.prodSizeCd }</td>
					<td>${result.prodRefCd }</td>
					<td>${result.purposeCd }</td>
					<td>${result.fileNm }</td>
					<td>
						<c:forEach var="resultList" items="${fileList}" varStatus="vs">
							${resultList.fileNm }<br/>
						</c:forEach>
					</td>
					<td>
						<c:if test="${result.acceptYn eq 'Y'}">승인</c:if>
						<c:if test="${result.acceptYn eq 'N'}">반려</c:if>
						<c:if test="${result.acceptYn eq 'W'}">대기</c:if>
						<c:if test="${result.acceptYn eq 'C'}">취소</c:if>
					</td>
					<td>${result.rejectMsg }</td>
				</tr>
		</tbody>
	</table>
</body>
</html>