<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.util.*" %>

<%@ page session="false" %>

<%
	ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
	InputStream fis = classLoader.getResourceAsStream("credentials.properties");
	Properties p = new Properties();
	p.load(fis);
	String EMAIL = p.getProperty("email");
	String PASSWORD = p.getProperty("password");
	
   HttpSession session = request.getSession(false);
   try{
      String recipient = (String)session.getAttribute("email");

      Properties props = System.getProperties();
      props.put("mail.smtp.host","smtp.gmail.com");
      props.put("mail.smtp.auth","true");
      props.put("mail.smtp.port","465");
      props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
      props.put("mail.smtp.socketFactory.port","465");
      props.put("mail.smtp.socketFactory.fallback","false");

      Session mailSession = Session.getDefaultInstance(props,null);
      mailSession.setDebug(true);

      Message msg = new MimeMessage(mailSession);
      msg.setFrom(new InternetAddress(EMAIL));
      msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

      msg.setContent((String)session.getAttribute("content"), "text/html");
      msg.setSubject((String)session.getAttribute("subject"));

      Transport transport = mailSession.getTransport("smtp");
      transport.connect("smtp.gmail.com", EMAIL, PASSWORD);

      transport.sendMessage(msg, msg.getAllRecipients());
   }catch(Exception e){
      %><%= e %>Sending an email was unsuccessful<br><%
   }
   
%>