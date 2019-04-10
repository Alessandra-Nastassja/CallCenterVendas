<% 
	session.invalidate();
	response.sendRedirect("loginServlet");
	
%>