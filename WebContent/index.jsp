<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<H3 ALIGN="LEFT">Self-diagnose</H3>

<FORM NAME="SEARCH_PAGE" ACTION = "LoggerServlet" 
      METHOD="GET">
<tr>
<td align="right" class="style1">Search:</td>
<td> <INPUT TYPE="TEXT" NAME="search_query" ID="search_query" VALUE="">
</td>
</tr>
  <CENTER>
    <INPUT TYPE="SUBMIT" VALUE="SUBMIT">
  </CENTER>
</FORM>
</BODY>
</html>