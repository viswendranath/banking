<%@ page session="false" %>

<%
    HttpSession session = request.getSession(false);
    if(session == null || session.getAttribute("uname") == null){
        %> Your session has already expired. Please login <a href="index.jsp">here</a> <%
    }else{
    	if(request.getParameter("operation").equals("Home")){
    		
    		%><jsp:forward page="home.jsp" /><%
    	}else if(request.getParameter("operation").equals("Transfer")){
    		
        	%><jsp:forward page='transfer.jsp'/><%
        }else if(request.getParameter("operation").equals("Deposit")){
            
            %><jsp:forward page='deposit.jsp' /><%
        }else if(request.getParameter("operation").equals("Statements")){
            
            %><jsp:forward page='statements.jsp' /><%
        }else if(request.getParameter("operation").equals("Apply")){
            
            %><jsp:forward page='apply.jsp' /><%
        }
    }
%>