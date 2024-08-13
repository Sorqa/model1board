<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 게시판</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
   function Logout() {

      $.ajax({
         url:'logout.jsp',
         method:'post',
         cache:false,
         data:{'cmd':'logout'},
         dataType:'json',
         success:function(res) {
            alert(res.logout ? '로그아웃 성공':'로그아웃 실패');                        
         },
         error:function(xhr,status,err){
            alert('에러:' + err);
         }
      });
      
   }
</script>

<script type="text/javascript">
function deleteit(){
	let obj = {}
	obj.bnum = $('#bnum').val();
	$.ajax({
		url:'deleteBoard.jsp',
		method:'post',
		cache:false,
		data:obj,
		dataType:'json',
		success:function(res){
			alert(res.deleted ? '삭제완료' : '삭제 불가능');
		},
		error:function(xhr, status, err){  // Corrected typo here
            alert('에러:' + err);
        }
	});
	
}
</script>
<body>
<main>
<h3>JSP개발방법론 Model 1을 사용한 게시판 프로젝트</h3></main>
<ul>
	<li><a href="../join/loginForm.jsp">로그인</a>
	<li><a href="javascript:Logout();">로그아웃</a>
	<li><a href="boardAddForm.jsp">게시글 입력</a>
	<li><a href="boardList.jsp">게시글 목록</a>	
</ul>
<div>
<label for="bnum">삭제할 번호</label>
	<input type="number" id="bnum" name="bnum">
	<button type="button" onclick="deleteit()">삭제</button>
</div>
</body>
</html>