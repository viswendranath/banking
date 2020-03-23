<%@page import="org.apache.log4j.Logger"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@page import='java.sql.*' %>

<%@ page session="false" %>
<%
    HttpSession session = request.getSession();
	Logger log = Logger.getLogger(this.getClass().getName());
    String uname = request.getParameter("username");
    String password = request.getParameter("password");
    
    ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
	InputStream fis = classLoader.getResourceAsStream("credentials.properties");
	Properties p = new Properties();
	p.load(fis);
	String DATABASE_URL = p.getProperty("database_url");
	String DATABASE_USERNAME = p.getProperty("database_username");
	String DATABASE_PASSWORD = p.getProperty("database_password");
	
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection(
    		DATABASE_URL,
    		DATABASE_USERNAME,
    		DATABASE_PASSWORD);

    String loginQuery = String.format(
        "select count(*) from account where uname='%s' and password='%s'", uname, password);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(loginQuery);
    while(rs.next()){
        int count = rs.getInt(1);
        log.debug(count);

        if(count == 1){
            log.debug("Login success");
            session.setAttribute("uname", uname);
            String loginDetails = String.format("select * from account where uname='%s' and password='%s'",
            uname,password);
            rs = stmt.executeQuery(loginDetails);
            while(rs.next()){
                session.setAttribute("amount", Double.toString(rs.getDouble(3)));
                session.setAttribute("email", rs.getString(4));
                session.setAttribute("ph_number", rs.getString(5));

                // Set max time for the session as 3 minutes
                session.setMaxInactiveInterval(180);

            }
            %><jsp:forward page='home.jsp' /><%
        }else{
            log.debug("Wrong password or uname");
            log.debug(uname);
            log.debug(password);
            out.println("<script>window.onload = function(){document.getElementById('message').innerHTML = 'Username or password is incorrect'; document.getElementById('message').style = 'color: red; font-size: 12px;'}</script>");
            %><jsp:include page='login.jsp' /><%
        }
    }
%>