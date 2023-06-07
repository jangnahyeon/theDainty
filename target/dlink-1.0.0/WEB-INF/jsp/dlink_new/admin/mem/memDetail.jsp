<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
function go_add() {
	document.getElementById("detailForm").action = "<c:url value='/admin/tbMem/updateTbMemView.do'/>";
   	document.getElementById("detailForm").submit();
} 
function  acceptYn(status){
	var params = $("#detailForm").serialize();
	params += "&acceptYn="+status;
	params += "&hp=" + "${tbMemVO.hp }";
	
	if(status == 'N' && $("#rejectMsg").val() == '') {
		alert("반려사유를 입력해주세요");
		
		return;
	}
	console.log(params);
	$.ajax({
		url : "/admin/tbMem/tbMemAcceotUpdate.do",
		data : params,
		dataType : "text",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
	    success: function(rs){
	    	if(rs == "Y") {
	    		if(status == "W") {
	        		alert("대기처리되었습니다.");
	    		} else if(status == "Y") {
	    			alert("승인처리되었습니다.");
	    		} else if(status == "N") {
	    			alert("반려처리되었습니다.");
	    		}
	        	location.reload();
	    	}
	    },
	    error:function(){
	        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
	    }
	});
	
}
function go_delete(memSeq) {
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("detailForm").memSeq.value = memSeq; 
		document.getElementById("detailForm").action = "<c:url value='/admin/tbMem/deleteTbMem.do'/>";
   		document.getElementById("detailForm").submit();
	}
} 
</script>
<form:form modelAttribute="tbMemVO" name="detailForm" id="detailForm" >
	<form:hidden path="memSeq"/>
	<form:hidden path="code"/>
	<div class="bd_btn_area right">
		<a href="#" onclick="javascript:acceptYn('W');" class="btn_st small line_blue">대기</a>
		<a href="#" onclick="javascript:acceptYn('Y');" class="btn_st small">승인</a>
		<a href="#" onclick="javascript:acceptYn('N');" class="btn_st small line_orange">반려</a>
	</div>
	<table class="bd_tbl bd_tbl_view">
		<caption>회원정보 </caption>
		<colgroup>
			<col width="15%">
			<col width="auto;">
			<col width="15%">
			<col width="auto;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"><label for="memId">아이디<span class="tbl_star">*</span></label></th>
				<td class="left">
					${tbMemVO.memId }
				</td>
				<c:if test="${tbMemVO.code eq '0002' }">
					<th scope="row"><label for="memNm">이름<span class="tbl_star">*</span></label></th>
					<td class="left">
						${tbMemVO.memNm }
					</td>
				</c:if>
				
				<c:if test="${tbMemVO.code eq '0003' }">
					<th scope="row"><label for="memNm">대표자 성명<span class="tbl_star">*</span></label></th>
					<td class="left">
						${tbMemVO.memNm }
					</td>
				</c:if>
			</tr>
			<c:if test="${tbMemVO.code eq '0003' }">
				<tr>
					<th scope="row"><label for="comNm">업체명<span class="tbl_star">*</span></label></th>
					<td class="left" >
						${tbMemVO.comNm }
					</td>
					<th scope="row"><label for="comNo">사업자등록번호<span class="tbl_star">*</span></label></th>
					<td class="left">
						${tbMemVO.comNo }
					</td>		
				</tr>
				<tr>				
					<th scope="row"><label for="email">담당자 성명<span class="tbl_star">*</span></label></th>
					<td class="left">
						${tbMemVO.damdangNm }
					</td>
					<th scope="row"><label for="hp">휴대폰 번호<span class="tbl_star">*</span></label></th>
					<td class="left">
						${tbMemVO.hp }
					</td>
				</tr>
			</c:if>
			<tr>
				<th scope="row"><label for="birth">생년월일</label></th>
				<td class="left">
					${tbMemVO.birth }
				</td>
				<th scope="row"><label for="email">이메일<span class="tbl_star">*</span></label></th>
				<td class="left">
					${tbMemVO.email }
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="smsYn">문자허용여부</label></th>
				<td class="left">
					<ul class="chk_area">
						<li><input onclick="return(false);" type="radio" name="smsYn" value="Y" id="smsY" <c:if test="${tbMemVO.smsYn eq 'Y' }">checked</c:if>> <label for="smsY">허용</label></li>
						<li><input onclick="return(false);" type="radio" name="smsYn" value="N" id="smsN" <c:if test="${tbMemVO.smsYn eq null  || tbMemVO.smsYn eq ''}">checked</c:if>> <label for="smsN">허용안함</label></li>
					</ul>
				</td>
				<th scope="row"><label for="emailYn">메일링허용여부</label></th>
				<td>
					<ul class="chk_area">
						<li><input onclick="return(false);" type="radio" name="emailYn" value="Y" id="emailY" <c:if test="${tbMemVO.emailYn eq 'Y' }">checked</c:if>> <label for="emailY">허용</label></li>
						<li><input onclick="return(false);" type="radio" name="emailYn" value="N" id="emailn" <c:if test="${tbMemVO.emailYn eq null || tbMemVO.emailYn eq ''}">checked</c:if>> <label for="emailn">허용안함</label></li>
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="useradd">주소</label></th>
				<td class="left" colspan="3">
					${tbMemVO.addr }
					${tbMemVO.addrDtl }
				</td>
			</tr>
			<c:if test="${tbMemVO.code eq '0003' }">
				<tr>
					<th scope="row"><label for="useradd">사업장 주소</label></th>
					<td class="left" colspan="3">
						${tbMemVO.comAddr }
						${tbMemVO.comAddrDtl }
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="comType">기업성격</label></th>
					<td class="left" colspan="3">
						<ul class="chk_area">
							<li><input onclick="return(false);" type="radio" name="comType" value="C" id="comType1" <c:if test="${tbMemVO.comType eq 'C' }">checked</c:if>> <label for="comType1">중소기업</label></li>
							<li><input onclick="return(false);" type="radio" name="comType" value="D" id="comType2" <c:if test="${tbMemVO.comType eq 'D' }">checked</c:if>> <label for="comType2">디자인전문회사</label></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="data_file">사업자등록증 첨부</label></th>
					<td class="left" colspan="3">
						<a href="/imagefile/download.do?file_no=${tbMemVO.comFileSeq }"> ${tbMemVO.fileNm }</a>
					</td>
				</tr>
			</c:if>
			<c:if test="${tbMemVO.code ne '0001' }">
			<tr>
				<th scope="row"><label for="useradd">처리상태</label></th>
				<td class="left" colspan="3">
					<c:if test="${tbMemVO.acceptYn eq 'Y'}">승인</c:if>
					<c:if test="${tbMemVO.acceptYn eq 'W'}">대기</c:if>
					<c:if test="${tbMemVO.acceptYn eq 'N'}">반려</c:if>
					<c:if test="${tbMemVO.acceptYn eq 'O'}">탈퇴</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="useradd">반려사유</label></th>
				<td class="left" colspan="3">
					<input type="text" name="rejectMsg" id="rejectMsg" value="${tbMemVO.rejectMsg }" maxlength="100"/>
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
		
	<div class="bd_btn_area right">
		<a href="#" class="btn_black line_gray" onclick="javascript:go_add();">수정</a>
		<a href="#" class="btn_black line_orange"onclick="javascript:go_delete('${tbMemVO.memSeq}');">삭제</a>
		<c:if test="${tbMemVO.code eq '0001' }">								
			<a href="/admin/mem/memList.do?code=0001" class="btn_black btn_list" >목록</a>
		</c:if>
		<c:if test="${tbMemVO.code eq '0002' }">								
			<a href="/admin/mem/memList.do?code=0002" class="btn_black btn_list" >목록</a>
		</c:if>
		<c:if test="${tbMemVO.code eq '0003' }">								
			<a href="/admin/mem/memList.do?code=0003" class="btn_black btn_list">목록</a>
		</c:if>
	</div>
</form:form>