<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--패키지명을 생략하고 간단하게 쓰겠다라고 import를 시켜줍니다.-->
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
	<%-- <div> 화면에만 출력하였을때.
		<%request.setCharacterEncoding("euc-kr"); %>
		학생 ID:<%=request.getParameter("s_id") %><br/>
		학생 이름:<%=request.getParameter("s_name") %><br/>
		학생 나이:<%=request.getParameter("s_age") %><br/>
		학생 그룹:<%=request.getParameter("s_group") %><br/>
	</div> --%>
<%
	// addStudentForm.html에서 값이 넘어올때 
	// 인코딩방식을 euc-kr로 넘겨줘 받을때도 euc-kr방식으로 받습니다.
	request.setCharacterEncoding("euc-kr");
	// request.getParameter()메소드를 통해 값을 얻어와 변수에 대입
	String s_id = request.getParameter("s_id");
	String s_pw = request.getParameter("s_pw");
	int s_age = Integer.parseInt(request.getParameter("s_age"));
	String s_group = request.getParameter("s_group");
	
	// 콘솔창에 확인을 위해 출력
	System.out.println("s_id : " + s_id);
	System.out.println("s_pw: " + s_pw);
	System.out.println("s_age : " + s_age);
	System.out.println("s_group : " + s_group);
	
	//1.orcle driver 로딩...
	// lib폴더에 ojdbc6.jar을 복사해서 넣어야 실행가능
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//2.DB연결
	// 첫번째 매개변수는 오라클주소, 두번째매게변수 사용자ID, 세번째 사용자패스워드
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","phcdb","java0000");
	//3.쿼리실행문장 준비
	//insert쿼리 실행문장을 넣어줍니다.
	PreparedStatement stmt = conn.prepareStatement("insert into tb_user(id, pw, age, class)values(?, ?, ?, ?)");
	//values값을 셋팅
	stmt.setString(1, s_id);
	stmt.setString(2, s_pw);
	stmt.setInt(3, s_age);
	stmt.setString(4, s_group);
	//4.쿼리실행
	stmt.executeUpdate();
%>
</body>
</html>
