<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<%
			try {
				DBManager db = DBManager.getInstance();
				Connection con = db.open();
				String query = "select var.variation from alcohol as al join variation as var on var.id=al.variation join category as cat on cat.id=al.category where cat.name='소주'";
				PreparedStatement stmt = con.prepareStatement(query);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					String name = rs.getString("variation");
		%>
		<a href="soju_proc.jsp?name=<%=name%>"><img
			src="img/soju/<%=name%>.PNG" class="rounded" alt="Cinque Terre">
		</a>
		<%
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		%>
	</div>
	<div class="col-sm-2"></div>
</div>
