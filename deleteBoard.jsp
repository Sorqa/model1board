<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="board" class="com.test.model1board.Board"/>
<jsp:setProperty name="board" property="*"/>
<jsp:useBean id="dao" class="com.test.model1board.BoardDAO"/>
<%
	
	boolean deleted = dao.delete(board);
	JSONObject jsObj = new JSONObject();
	jsObj.put("deleted",deleted);	
	out.print(jsObj.toJSONString());
	out.flush();
%>