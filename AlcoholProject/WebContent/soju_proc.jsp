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
		//		String name = "ó��ó�� ����";
		String name = request.getParameter("name");
		//.split(".")[0];
		String query = "select al.name, al.url, al.abv, var.variation, cat.name from alcohol as al join variation as var on var.id=al.variation join category as cat on cat.id=al.category where var.variation='"
				+ name + "'";
		PreparedStatement stmt = con.prepareStatement(query);
		// 4. SQL (Query) ����
		ResultSet rs = stmt.executeQuery();
		// 5. (��ȸ��) ��ȸ��� ó��
		while (rs.next()) {
			String aUrl = rs.getString("al.url");
			String aAbv = rs.getString("al.abv");
			String aVariation = rs.getString("var.variation");
			String aCategory = rs.getString("cat.name");
%>
<ul class="list-group">
  <li class="list-group-item">��ǰ��: <%=aVariation%></li>
  <li class="list-group-item">����: <%=aAbv%></li>
  <li class="list-group-item"><a href=<%=aUrl%>>��ǰ ����</a></li>
</ul>
<%
	}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>