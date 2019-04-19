<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	out.println("성인이 맞습니까?");
	String isCheck = "0";
	if(true) //참이라면
		isCheck = "1";
	session.setAttribute("Check", isCheck);
%>