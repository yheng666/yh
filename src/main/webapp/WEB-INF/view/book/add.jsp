<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2018/10/22
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加图书</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/book/add.jhtml" method="post">
    <table>
        <tr>
            <td>图书名：</td>
            <td>
                <input type="text" name="bookName"/>
            </td>
        </tr>
        <tr>
            <td>图书价格：</td>
            <td>
                <input type="text" name="bookPrice"/>
            </td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <input type="submit" value="添加"/>
            </td>
        </tr>

    </table>
</form>
</body>
</html>
