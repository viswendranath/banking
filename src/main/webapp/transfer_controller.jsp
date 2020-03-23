<%@page import="org.apache.log4j.Logger"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@ page import='java.sql.*' %>

<%@ page session="false" %>

<%
	Logger log = Logger.getLogger(this.getClass().getName());
	
    HttpSession session = request.getSession(false);
    if(session == null || session.getAttribute("uname") == null){
        %> Your session has already expired. Please login <a href="index.jsp">here</a> <%
    }else{
        String transfer_name = (String)session.getAttribute("transfer_name");
        double transfer_amount = Double.parseDouble((String)session.getAttribute("transfer_amount"));
        double current_amount = Double.parseDouble((String)session.getAttribute("amount"));
        
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

        Statement stmt = con.createStatement();
        if(current_amount >= transfer_amount && !((String)session.getAttribute("uname")).equals(transfer_name)){

            String retriveQuery = String.format("select amount from account where uname ='%s'", transfer_name);
            ResultSet rs = stmt.executeQuery(retriveQuery);
            double personAmount = 0;
            while(rs.next()){
                personAmount = rs.getDouble(1);
            }
            double totalAmount = personAmount + transfer_amount;
            log.debug("transfer_controller.jsp -- to users balance would be " + (transfer_amount+personAmount));
            
            String currentAmountQuery = String.format("update account set amount = %f where uname='%s'", 
                current_amount-transfer_amount, (String)session.getAttribute("uname"));
            stmt.executeUpdate(currentAmountQuery);
            session.setAttribute("amount", Double.toString(current_amount-transfer_amount));
            
            // To use transfer_amounti in email section put this amount in session
            session.setAttribute("transfer_amount", Double.toString(transfer_amount));

            String amountQuery = String.format("update account set amount = %f where uname='%s'", totalAmount, transfer_name);
            int rowsAffected = stmt.executeUpdate(amountQuery);
            log.debug("Rows affected are " + rowsAffected);
            if(rowsAffected == 0){
                %>Payment Failed.<%

                String failRecoveryQuery = String.format("update account set amount = %f where uname='%s'",
                    current_amount, (String)session.getAttribute("uname"));
                stmt.executeUpdate(failRecoveryQuery);

                session.setAttribute("amount", Double.toString(current_amount));
            }else{
                String updateTransactionQuery = String.format("insert into transactions values('%s','%s',%f)",
                    (String)session.getAttribute("uname"), transfer_name, transfer_amount);
                stmt.executeUpdate(updateTransactionQuery);
                session.setAttribute("content","Your transaction of amount INR. " + (String)session.getAttribute("transfer_amount") + " was successfull. <br> If this wasn't you please contact customer care.");
                session.setAttribute("subject","Your transaction was successfull");
                session.setAttribute("transaction_start", null);
                %><jsp:include page='mailController.jsp' /><%
                %>Payment Successfull.<%
            }

            %><br>You will be redirected to home page...<%
        }else if(current_amount < transfer_amount){
            %>Insufficient Balence.<br>You will be redirected to home page...<%
        }else if(((String)session.getAttribute("uname")).equals(transfer_name)){
        	%>Transfer username should be different.<br>You will be redirected to home page...<%
        }
        response.setHeader("Refresh", "2;url=home.jsp");
    }
        

%>