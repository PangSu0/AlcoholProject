<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container-title">
		<%@include file="title.jsp"%>
	</div>
	<div class="button">
		<%@include file="button.jsp"%>
	</div>
	<div class="main">
		<%
			try {
				DBManager db = DBManager.getInstance();
				Connection con = db.open();
				String name = request.getParameter("name");
				//.split(".")[0];
				String query = "select al.name, al.url, al.abv, var.variation, cat.name from alcohol as al join variation as var on var.id=al.variation join category as cat on cat.id=al.category where var.variation='"
						+ name + "'";
				PreparedStatement stmt = con.prepareStatement(query);
				// 4. SQL (Query) 실행
				ResultSet rs = stmt.executeQuery();
				// 5. (조회시) 조회결과 처리
				while (rs.next()) {
					String aUrl = rs.getString("al.url");
					String aAbv = rs.getString("al.abv");
					String aVariation = rs.getString("var.variation");
					String aCategory = rs.getString("cat.name");
		%>
		<ul class="list-group">
			<li class="list-group-item">제품명: <%=aVariation%></li>
			<li class="list-group-item">도수: <%=aAbv%></li>
			<li class="list-group-item"><a href=<%=aUrl%>>제품 정보</a></li>
		</ul>
		<%
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		%>
	</div>
</body>
</html>

<%@include file="menuMove.jsp"%>