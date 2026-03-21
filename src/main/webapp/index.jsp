<%@ page import="java.util.Calendar" %>
<html>
<body>
<%
    Calendar cal = Calendar.getInstance();
    int hour = cal.get(Calendar.HOUR_OF_DAY);
    //int hour = 15;
    String greeting = (hour < 12) ? "Good morning" : "Good afternoon";
%>
<h1><%= greeting %>, Percy, Welcome to COMP367</h1>
</body>
</html>