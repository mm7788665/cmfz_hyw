<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../back/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../back/themes/IconExtension.css">
    <script type="text/javascript" src="../back/js/jquery.min.js"></script>
    <script type="text/javascript" src="../back/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../back/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
    <div style="text-align: center;">
        <form id="editAdminInputForm" class="easyui-form" method="get">
            <input type="hidden" name="id" value="${login.id}">
            <div style="margin-top: 70px;">
                用户名: <input type="text" name="name" value="${login.username}" class="easyui-textbox" data-options="required:true,">
            </div>
            <div style="margin-top: 70px;">
                旧密码: <input type="text" name="oldpassword" value="" class="easyui-textbox" data-options="required:true,">
            </div>
            <div style="margin-top: 70px;">
                新密码: <input type="text" name="password" value="" class="easyui-textbox" data-options="required:true,">
            </div>


        </form>
    </div>
</body>
</html>
