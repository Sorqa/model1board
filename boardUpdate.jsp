<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="update" class="com.test.model1board.Board"/>
<jsp:setProperty name="update" property="*"/>
<jsp:useBean id="dao" class="com.test.model1board.BoardDAO"/>
<%	 
	boolean updated = dao.updateBoard(update);
	JSONObject jsObj = new JSONObject();
	jsObj.put("updated",updated);	
	out.print(jsObj.toJSONString());
	out.flush();
%>