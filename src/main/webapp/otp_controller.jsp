<%! int otpCheckCount = 0; %>

<%@ page session="false" %>

<%

    HttpSession session = request.getSession(false);
    if(session == null || session.getAttribute("uname") == null){
        %> Your session has already expired. Please login <a href="index.jsp">here</a> <%
    }else{
        String entered_otp = request.getParameter("otp").trim();
        String generated_otp = ((String)session.getAttribute("otp")).trim();
        if(otpCheckCount >= 2){
            otpCheckCount = 0;
            session.setAttribute("transaction_start", null);
            %>Wrong OTP limit exceeded<%
            response.setHeader("Refresh", "2;url=home.jsp");
        }else if(session.getAttribute("transaction_start") != null){
            if(generated_otp != null && entered_otp != null && entered_otp.equals(generated_otp)){
                // OTP matched. forward transaction to transfer controller
                %><jsp:forward page='transfer_controller.jsp' /><%
            }else{
                // OTP mismatch. Display error message
                otpCheckCount++;
                out.println("<script>window.onload = function(){document.getElementById('error_otp').innerHTML = 'Incorrect OTP';}</script>");
                %><jsp:include page='otp.jsp' /><%
            }
        }else{
            %><jsp:forward page='transfer.jsp' /><%
        }
        
    }
%>