<%@ page session="false" %>

<%
	HttpSession session = request.getSession(false);
	if(session != null && session.getAttribute("uname") != null){
	    session.invalidate();
	    response.sendRedirect("login.jsp");
	}else{
		%>
	        <center>Session is invalid please login <a href="index.jsp">here</a></center>
		<%
	}
%>