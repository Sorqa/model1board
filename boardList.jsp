<%@page import="com.test.model1board.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.test.model1board.BoardDAO"/>
<% List<Board> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>


</head>
<body>
<div id="main">
<table>
<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
<% 
	for (int i = 0; i < list.size(); i++) { 
		Board b = list.get(i);%>
    <tr>
    <td><a href="boardDetail.jsp?bnum=<%= b.getBnum()%>"><%= b.getBnum()%></a></td> 
    <td><%= b.getTitle() %></td>
    <td><%= b.getAuthor() %></td> 
    <td><%= b.getRdate() %></td>
    <td><%= b.getHit() %></td> 	    	
    </tr>
    
<%} %> 
</table>

</div>
</body>
</html>