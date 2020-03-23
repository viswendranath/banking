<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@ page import='java.sql.*' %>

<%@ page session="false" %>

<%

	ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
	InputStream fis = classLoader.getResourceAsStream("credentials.properties");
	Properties p = new Properties();
	p.load(fis);
	String DATABASE_URL = p.getProperty("database_url");
	String DATABASE_USERNAME = p.getProperty("database_username");
	String DATABASE_PASSWORD = p.getProperty("database_password");

    HttpSession session = request.getSession(false);
    
    if(session == null || session.getAttribute("uname") == null){
        %> Your session has already expired. Please login <a href="index.jsp">here</a> <%
    }else{
        double deposit_amount = Double.parseDouble(request.getParameter("transfer_amount"));
        double current_amount = Double.parseDouble((String)session.getAttribute("amount"));

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(
        		DATABASE_URL,
        		DATABASE_USERNAME,
        		DATABASE_PASSWORD);

        Statement stmt = con.createStatement();
        String amountUpdateQuery = String.format("update account set amount = %f where uname = '%s'",
            current_amount + deposit_amount, (String)session.getAttribute("uname"));
        
        stmt.executeUpdate(amountUpdateQuery);
        session.setAttribute("amount", Double.toString(current_amount+deposit_amount));
        %>Payment Successfull.<br>You will be redirected to home page...<%

        response.setHeader("Refresh", "2;url=home.jsp");
    }

%>