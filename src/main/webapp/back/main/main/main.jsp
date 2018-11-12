<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    if (session.getAttribute("login") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../themes/IconExtension.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/ui-sunny/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/treegrid-dnd.js"></script>
    <%--<script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>--%>
    <script type="text/javascript">


        <!--菜单处理-->
        $(function () {
            //页面加载完成之后显示菜单数据
            $.post("${pageContext.request.contextPath}/menu/queryAll",function (menu) {
                //通过accordion的添加方法追加菜单
                console.log(menu);
                //遍历一级菜单
                $.each(menu,function (index,menu) {
                    //遍历二级菜单
                    var content = "<div style='text-align: center;'>";
                    $.each(menu.lists,function(idx,child){
                        content += "<a onclick=\"addTabs('"+child.title+"','"+child.iconCls+"','"+child.href+"')\" style='width:95%;margin:10px 0px; border: 2px #eec1be solid;' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.title+"</a><br>";
                    });
                    content += "</div>"
                    //添加菜单
                    $("#menu").accordion('add',{
                        title:menu.title,
                        iconCls:menu.iconCls,
                        content:content,
                    })
                });

            });
        });

        //点击菜单追加选项卡
        function addTabs(title,iconCls,href){
            //添加以前先判断tabs中是否存在这个选项卡
            if(!$("#tabs").tabs('exists',title)){
                $("#tabs").tabs('add',{
                    title:title,
                    iconCls:iconCls,
                    closable:true,
                    fit:true,
                    href:"${pageContext.request.contextPath}/"+href,
                });
            }else{
                $("#tabs").tabs('select',title);
            }

        };

        //修改管理员密码
        function editpassword() {

            $("#editpassword").dialog({
                href:'${pageContext.request.contextPath}/back/main/main/edit.jsp',
                buttons:[
                    {
                        iconCls:'icon-save',
                        text:"修改",
                        handler:function(){
                            $("#editAdminInputForm").form('submit',{
                                url:"${pageContext.request.contextPath}/admin/update",
                                success:function (result) {//注意一定是json字符串  使用需要转为js对象


                                    //提示修改信息
                                    $.messager.show({title:'提示',msg:"管理员信息修改成功!!!"});
                                    //关闭dialog
                                    $("#editpassword").dialog('close');

                                }
                            })
                        }
                    },
                    {
                        iconCls:'icon-cancel',
                        text:"取消",
                        handler:function(){
                            $("#editpassword").dialog('close');
                        }
                    },
                ]
            });

        }
    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">


    <div id="time1"
         style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 260px;float:left;padding-top:15px;padding-left: 30px">
        <script type="text/javascript">
            //非动态显示
            //document.getElementById('time1').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
            //动态显示
            setInterval("document.getElementById('time1').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
        </script>
    </div>

    <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 320px;padding-top: 10px" >持名法州后台管理系统  </div>
    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎：${sessionScope.login.username}
        <a href="#"  class="easyui-linkbutton"  onclick="editpassword()" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;
        <a href="${pageContext.request.contextPath}/admin/exit" class="easyui-linkbutton" onclick="quit()" data-options="iconCls:'icon-01'">退出系统</a></div>



</div>
<div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    <div id="menu" class="easyui-accordion" data-options="fit:true">

    </div>
</div>

<%--页面的中心位置--%>
<div data-options="region:'center'">
    <div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',  closable:true,"  style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
    </div>


</div>


<%--datagrid数据表格--%>
<table id="dg"></table>
<%--修改密码对话框--%>
<div id="editpassword" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'修改管理员密码'">
</div>
</body>
</html>