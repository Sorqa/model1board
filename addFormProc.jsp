<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="board" class="com.test.model1board.Board"/>
<jsp:setProperty name="board" property="*"/>
<%
   board.setAuthor((String)session.getAttribute("uid"));
   java.util.Date uDate = new java.util.Date();
   java.sql.Date sDate = new java.sql.Date(uDate.getTime());
   board.setRdate(sDate);
%>
<jsp:useBean id="dao" class="com.test.model1board.BoardDAO"/>
<%
	int bnum = dao.addBoard(board);
	boolean saved = bnum>0;
	JSONObject jsObj = new JSONObject();
	jsObj.put("saved",saved);
	jsObj.put("bnum",bnum);
	out.print(jsObj.toJSONString());
	out.flush();
%>
<%--글번호,제목,작성자,내용,작성일,히트수--%>


<%--{"saved":<%=saved %>,"bnum":<%=bnum%>} --%>
<%--저장하면 상세보기--%>