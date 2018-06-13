<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Import data</title>
</head>
<body>
<h2>Dữ liệu các trường đại học: </h2>
<form action="<%=request.getContextPath() %>/ImportData" method="post">
	<input type="submit" value="Import">
</form>

<h2>Dữ liệu các ngành trong các trường đại học: </h2>
<form action="<%=request.getContextPath() %>/ImportSector" method="post">
	<input type="submit" value="Import">
</form>

</body>
</html>