<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();

		// 3. Query 실행 준비
		String query = "select name, url, abv, variation, category from alcohol where category='소주'";
		PreparedStatement stmt = con.prepareStatement(query);
		// 4. SQL (Query) 실행
		ResultSet rs = stmt.executeQuery();
		// 5. (조회시) 조회결과 처리
		while (rs.next()) {
			String aName = rs.getString("name");
			String aUrl = rs.getString("url");
			String aAbv = rs.getString("abv");
			String aVariation = rs.getString("variation");
			String aCategory = rs.getString("category");
%>
<form method="post" action="home_proc.jsp">
	<input type="text" name="name" value="<%=aName%>"><br> 
	<input type="text" name="variation" value="<%=aVariation%>"><br>
	<input type="text" name="abv" value="<%=aAbv%>"><br>
	<input type="url" name="url" value="<%=aUrl%>">
<%-- 	<input type="text" name="category" value="<%=aCategory%>"><br> --%>
</form>

<%
	}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>