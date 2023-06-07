<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script type="text/javaScript" type="text/javascript">
$(function() {
	$('#treeBox').jstree({ 
		'core' : { 
			'data' : ${menuJsonList}
			} 
	});
	
	
	$('#treeBox').bind('select_node.jstree', function(event, data){
		var result;
		menuId = data.node.id;
		$.ajax({
		    type: "POST",
		    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    url: "/admin/menu/menuAjaxSelect.do",
		    data : {menuId:menuId},
		    dataType: "text",
		    success: function(data){
		    	result  = eval( "(" +data+ ")" );
		    	
		    	$("#menuId").val(result.menuId);
		    	$("#menuNm").val(result.menuNm);
		    	$("#upMenuId").val(result.upMenuId);
		    	$("#menuPath").val(result.menuPath);
		    	$("#ordSeq").val(result.ordSeq);
		    	$("input:radio[name='disYn']:radio[value='"+result.disYn+"']").attr("checked", true);
		    	$("#menuCont").val(result.menuCont);
		    	$("#menuGubun").val(result.menuGubun);
		    	$("#flag").val("update");
		    	$("#menuId").attr("readonly",true);
		    },
		    error:function(){
		        alert("오류가 발생하였습니다. \n다시 시도해 보시기 바랍니다.");
		    }
		});
	});
});




function fn_insert() {
	
	if(confirm("등록하시겠습니까??")){
		
		var flag = $("#flag").val();
		if(flag == 'insert'){
			document.getElementById("listForm").action = "<c:url value='/admin/menu/menuMagmtInsert.do'/>";
		} else {
			document.getElementById("listForm").action = "<c:url value='/admin/menu/menuMagmtUpdate.do'/>";
		}
	   	document.getElementById("listForm").submit();
	}
} 

function reset() {
	$("#listForm input").val("");
	$("#menuId").attr("readonly",false);
	$("#flag").val("insert");
}

function fn_delete(){
	var menuId = $("#menuId").val();
	if(menuId == ''){
		alert("메뉴를 선택해 주세요.");
		return false;
	}
	
	if(confirm("삭제하시겠습니까??")){
		document.getElementById("listForm").action = "<c:url value='/admin/menu/menuMagmtDelete.do'/>";
	   	document.getElementById("listForm").submit();
	}
}

function checkNumber(event) {
	  if( (event.key >= 0 && event.key <= 9) || event.key == "Backspace") {
	    return true;
	  }
	  
	  return false;
}
</script>
	<!-- 컨텐츠 영역 s -->
		
		<div class="menu_area">
		
			<div class="fl">
				<div class="menu_top">
					<!-- 
					<ul class="tab_style01">
						<li class="on"><a href="#">전체 펼쳐보기</a></li>
						<li class="on"><a href="#">선택된 카테고리만보기</a></li>
					</ul>
					 -->
				</div>
				<div id="treeBox">
					<!-- <div id="category"></div> -->
				</div>
			</div>
			
			<div class="fr">
				<h4 class="mt0 tit area_left">메뉴</h4>
				<form action="" method="post" id="listForm" name="listForm">
					<input type="hidden" id="flag" value="insert">
					<table class="bd_tbl bd_tbl_view">
						<caption>메뉴 내용 입력폼</caption>
						<colgroup>
							<col width="130">
							<col width="*">
						</colgroup>
						<tbody>
						<tr>
							<th>메뉴ID</th>
							<td>
								<input type="text" name="menuId" id="menuId" class="txt "maxlength="100">
							</td>
						</tr>
						<tr>
							<th>메뉴명</th>
							<td>
								<input type="text" name="menuNm" id="menuNm" class="txt "maxlength="100">
							</td>
						</tr>
						
						<tr>
							<th>상위메뉴ID</th>
							<td>
								<input type="text" name="upMenuId" id="upMenuId" value="" class="txt" maxlength="100">
							</td>
						</tr>
						<tr>
							<th>메뉴구분</th>
							<td>
								<input type="text" name="menuGubun" id="menuGubun" value="" class="txt" maxlength="100">
							</td>
						</tr>
						<tr>
							<th>메뉴경로</th>
							<td>
								<input type="text" name="menuPath" id="menuPath" value="" class="txt" maxlength="100">
							</td>
						</tr>
						<tr>
							<th>정렬순서</th>
							<td>
								<input type="text" name="ordSeq" value="" id="ordSeq" class="txt" maxlength="3" onkeydown="return checkNumber(event);">
							</td>
						</tr>
						<tr>
							<th>메뉴설명</th>
							<td>
								<input type="text" name="menuCont" value="" id="menuCont" class="txt" maxlength="100">
							</td>
						</tr>
						<tr>
							<th>표시 여부</th>
							<td>
								<ul class="chk_area">
									<li><input type="radio" name="disYn" value="Y" id="disYn1" checked> <label for="disYn1">Y</label></li>
									<li><input type="radio" name="disYn" value="N" id="disYn2"> <label for="disYn2">N</label></li>
								</ul>
							</td>
						</tr>
						</tbody>
						</table>
					</form>
			</div>
		</div>
		
		
		<div class="bd_btn_area right">
			<a href="#" class="btn_black" onclick="reset();">초기화</a>
			<a href="#" class="btn_black line_gray" onclick="fn_insert();">등록</a>
			<a href="#" class="btn_black line_orange" onclick="fn_delete();">삭제</a>
		</div>

	<!-- //컨텐츠 영역 e -->
				