<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script>

    </script>
</head>
<body>

<div id="w" class="easyui-dialog"  title="请先登录"
     data-options="modal:true,iconCls:'Lockgo',closable:false,minimizable:false"
     style="width:400px;padding:20px 70px 20px 70px;">

    <div style="margin-bottom:10px">
        <input class="easyui-textbox" id="logname"  name="username" style="width:100%;height:30px;padding:12px"
               data-options="prompt:'登录邮箱',iconCls:'icon-man',iconWidth:38">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" id="logpass" type="password" name="password" style="width:100%;height:30px;padding:12px"
               data-options="prompt:'登录密码',iconCls:'icon-lock',iconWidth:38">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" type="text" id="logyzm" style="width:50%;height:30px;padding:12px"
               data-options="prompt:'验证码'"> <a href="javascript:;" class="showcode" onclick="changeVeryfy()">
        <img style=" margin:0 0 0 3px ; vertical-align:middle; height:26px;" src="http://www.baidu.com/img/baidu_jgylogo3.gif"></a>
    </div>
    <div style="margin-bottom:20px">
        <input type="checkbox" checked="checked" id="logrem">
        <span>Remember me</span>
    </div>
    <div>
        <a href="${pageContext.request.contextPath}/admin/login" onclick="dologin()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           style="padding:5px 0px;width:100%;">
            <span style="font-size:14px;">登录</span>
        </a>
    </div>


</div>


</body>
</html>