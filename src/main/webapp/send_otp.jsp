<%@page import="org.apache.log4j.Logger"%>
<%@ page import='java.util.concurrent.ThreadLocalRandom' %>

<%@ page session="false" %>

<%
	Logger log = Logger.getLogger(this.getClass().getName());

    HttpSession session = request.getSession(false);
    if(session == null || session.getAttribute("uname") == null){
        %> Your session has already expired. Please login <a href="index.jsp">here</a> <%
    }else{

        session.setAttribute("transaction_start","true");

        session.setAttribute("transfer_name",request.getParameter("transfer_name"));
        session.setAttribute("transfer_amount", request.getParameter("transfer_amount"));

        log.debug(request.getParameter("transfer_amount"));

        int number = ThreadLocalRandom.current().nextInt(100000, 1000000);
        session.setAttribute("otp",Integer.toString(number));
        String content = String.format("Your one time password is : %d",number);
        String subject = "Transaction OTP";

        session.setAttribute("content",content);
        session.setAttribute("subject",subject);

        log.debug(number);
        %>
        <jsp:include page='mailController.jsp' />
        <jsp:forward page='otp.jsp' />
        <%
        
    }
%>