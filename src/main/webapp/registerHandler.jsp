<%@page import="org.apache.log4j.Logger"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@page import='java.sql.*' %>

<%@ page session="false" %>

<%
	Logger log = Logger.getLogger(this.getClass().getName());	

	ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
	InputStream fis = classLoader.getResourceAsStream("credentials.properties");
	Properties p = new Properties();
	p.load(fis);
	String DATABASE_URL = p.getProperty("database_url");
	String DATABASE_USERNAME = p.getProperty("database_username");
	String DATABASE_PASSWORD = p.getProperty("database_password");

    HttpSession session = request.getSession(false);
    String uname = request.getParameter("susername");
    String password = request.getParameter("confirmpassword");
    String email = request.getParameter("email");
    String ph_number = request.getParameter("phone");
    
    log.debug("In registerHandler.jsp -- " + uname);
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection(
    		DATABASE_URL,
    		DATABASE_USERNAME,
    		DATABASE_PASSWORD);

    Statement stmt = con.createStatement();

    String registerCheckQuery = String.format("select count(*) from account where uname = '%s'", uname);
    ResultSet rs = stmt.executeQuery(registerCheckQuery);
    boolean valid = false;
    while(rs.next()){
        if(rs.getInt(1) == 0){
            valid = true;
        }
    }
    if(valid){
        String registerQuery = String.format("insert into account values( '%s', '%s', 0, '%s', '%s')",
        uname,password,email,ph_number);
        
        stmt.executeUpdate(registerQuery);
        log.debug("Registered Successfully");

        out.println("<script>window.onload = function(){document.getElementById('message').innerHTML = 'Registered successfully'; document.getElementById('message').style = 'color: green; font-size: 12px;'}</script>");
        %><jsp:include page='register.jsp' /><%
    }else{
        out.println("<script>window.onload = function(){document.getElementById('message').innerHTML = 'The username is already taken. Please choose something else.'; document.getElementById('message').style = 'color: red; font-size: 12px;'}</script>");
        %><jsp:include page='register.jsp' /><%
    }
    
%>