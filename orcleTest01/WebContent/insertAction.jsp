<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--��Ű������ �����ϰ� �����ϰ� ���ڴٶ�� import�� �����ݴϴ�.-->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <div> ȭ�鿡�� ����Ͽ�����.
		<%request.setCharacterEncoding("euc-kr"); %>
		�л� ID:<%=request.getParameter("s_id") %><br/>
		�л� �̸�:<%=request.getParameter("s_name") %><br/>
		�л� ����:<%=request.getParameter("s_age") %><br/>
		�л� �׷�:<%=request.getParameter("s_group") %><br/>
	</div> --%>
<%
	// addStudentForm.html���� ���� �Ѿ�ö� 
	// ���ڵ������ euc-kr�� �Ѱ��� �������� euc-kr������� �޽��ϴ�.
	request.setCharacterEncoding("euc-kr");
	// request.getParameter()�޼ҵ带 ���� ���� ���� ������ ����
	String s_id = request.getParameter("s_id");
	String s_pw = request.getParameter("s_pw");
	int s_age = Integer.parseInt(request.getParameter("s_age"));
	String s_group = request.getParameter("s_group");
	
	// �ܼ�â�� Ȯ���� ���� ���
	System.out.println("s_id : " + s_id);
	System.out.println("s_pw: " + s_pw);
	System.out.println("s_age : " + s_age);
	System.out.println("s_group : " + s_group);
	
	//1.orcle driver �ε�...
	// lib������ ojdbc6.jar�� �����ؼ� �־�� ���డ��
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//2.DB����
	// ù��° �Ű������� ����Ŭ�ּ�, �ι�°�ŰԺ��� �����ID, ����° ������н�����
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","phcdb","java0000");
	//3.�������๮�� �غ�
	//insert���� ���๮���� �־��ݴϴ�.
	PreparedStatement stmt = conn.prepareStatement("insert into tb_user(id, pw, age, class)values(?, ?, ?, ?)");
	//values���� ����
	stmt.setString(1, s_id);
	stmt.setString(2, s_pw);
	stmt.setInt(3, s_age);
	stmt.setString(4, s_group);
	//4.��������
	stmt.executeUpdate();
%>
</body>
</html>
