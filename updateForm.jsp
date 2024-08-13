<%@page import="com.test.model1board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.test.model1board.BoardDAO"/>
<% int bnum = Integer.parseInt(request.getParameter("bnum"));
    Board b = dao.getBoard(bnum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
function updateit(){
	if(!confirm('수정된 글을 저장할까요?')) return;
	
	var ser = $('#updateForm').serialize();
    $.ajax({
        url:'boardUpdate.jsp',
        method:'post',
        cache:false,
        data:ser,
        dataType:'json',  
        success:function(res){  
            alert(res.updated ? '저장되었습니다' : '수정 실패');      
            if(res.updated){
            	location.href = "boardDetail.jsp?bnum=<%=b.getBnum()%>";
            }
        },
        error:function(xhr, status, err){  
            alert('에러:' + err);
        }
    });
}
</script>
</head>
<body>
<form id="updateForm">
<label for="bnum">번호</label><%=b.getBnum()%>
<input type="hidden" id="bnum" name="bnum" value="<%=b.getBnum()%>"> 
<label for="title">수정할 제목</label>
<input type="text" name="title" id="title" value="<%=b.getTitle()%>">
<label for="contents">수정할 내용</label>
<textarea name="contents" id="contents" rows="5" cols="20" placeholder="<%=b.getContents()%>"></textarea>
<div>
	    <button type="reset">취소</button>
	    <button type="button" onclick="updateit()">저장</button>
	</div>
</form>
</body>
</html>