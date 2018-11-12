<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {

        $("#guruDg").datagrid({
            url: "${pageContext.request.contextPath}/guru/findAll",
            pagination: true,
            rownumbers: true,
            toolbar: [
                {
                    text: '添加',
                    iconCls: 'icon-add',
                    handler: openGuruDialog,
                },
                {
                    text: '批量删除',
                    iconCls: 'icon-remove',
                    handler: delBathRows,
                }
            ],
            columns: [[
                {title: 'cks', field: 'cks', checkbox: true},
                {title: "id", field: 'id', width: 120,},
                {title: "上师姓名", field: 'name', width: 120,},
                {title: "性别", field: 'gender', width: 120,},

                {
                    title: "操作", field: 'options', width: 220,
                    formatter: function (value, row, index) {
                        return "<a href='javascript:;' class='options' onclick=\"delRow('" + row.id + "')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" +
                            "<a href='javascript:;' class='options' onclick=\"openEditGuruDialog('" + row.id + "')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";

                    }
                }
            ]],
            onLoadSuccess: function () {
                $(".options").linkbutton();
            },
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/back/main/guru' + rowData.headPic + '" style="height:80px;"></td>' +
                    '<td style="border:0">' +
                    /*'<p>createDate: ' + rowData.createDate + '</p>' +*/
                    '<p>imgPath: ' + rowData.headPic + '</p>' +
                    /*'<p>Status: ' + rowData.status + '</p>' +*/
                    '</td>' +
                    '</tr></table>';
            }

        });

    });

    //添加carousel
    function openGuruDialog() {
        $("#saveGuruDialog").dialog({
            href: '${pageContext.request.contextPath}/back/main/guru/save.jsp',
            buttons: [
                {
                    text: '保存',
                    iconCls: "icon-save",
                    handler: function () {
                        //保存用户信息
                        $("#saveGuruForm").form('submit', {
                            url: '${pageContext.request.contextPath}/guru/save',
                            success: function (result) {//响应的一定是json格式字符串 使用应该先转为js对象
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }else{
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //关闭对话框
                                $("#saveGuruDialog").dialog('close');
                                //刷新datagrid表格
                                $("#guruDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text: '关闭',
                    iconCls: "icon-cancel",
                    handler: function () {
                        $("#saveGuruDialog").dialog('close');
                    }
                },
            ]
        });
    }

    //修改对话框
    function openEditGuruDialog(id) {
        $("#editGuruDialog").dialog({
            href:'${pageContext.request.contextPath}/back/main/guru/edit.jsp?id='+ id,
            buttons: [
                {
                    iconCls: 'icon-save',
                    text:"保存",
                    handler: function () {
                        $("#editGuruForm").form('submit',{
                            url: "${pageContext.request.contextPath}/guru/update",
                            success: function (result) {//注意一定是json字符串 使用需要转为js对象
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }else{
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //关闭对话框
                                $("#editGuruDialog").dialog('close');
                                //刷新datagrid表格
                                $("#guruDg").datagrid('reload');
                            }
                        })
                    }
                },
                {
                    iconCls: 'icon-cancel',
                    text: "取消",
                    handler: function () {
                        $("#editGuruDialog").dialog('close');
                    }
                },
            ]
        });
    }

    //批量删除多行
    function delBathRows() {
        var rows = $("#guruDg").datagrid('getSelections');
        if (rows.length <= 0) {
            $.messager.show({title: '提示', msg: "至少选中一行"});
        } else {
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                //console.log(rows[i].id);
                ids.push(rows[i].id);
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/guru/delete",
                type: "post",
                traditional: true,//传递数据类型的数据时必须设置这个属性为true
                data: {id: ids},
                success: function (result) {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除成功！！！"});
                    //刷新datagrid
                    $("#guruDg").datagrid('reload');
                },
                error: function () {
                    //消息提示
                    $.messager.show({title: '提示', msg: "删除失败！！！"});
                    //刷新datagrid
                    $("#guruDg").datagrid('reload');
                }
            })
        }
    }

    //删除一行的事件
    function delRow(id) {
        //获取当前点击id发送ajax请求删除id这个人的信息
        $.post("${pageContext.request.contextPath}/guru/deleteGuru", {"id": id}, function (result) {//响应成功之后回调
            //刷新datagrid数据
            $("#guruDg").datagrid('reload');//刷新当前datagrid
        });
    }
</script>
<table id="guruDg" class="easyui-datagrid" data-options="fit:true">


</table>
<%--添加、跟新对话框--%>
<div id="saveGuruDialog" data-options="width:600,height:400,iconCls:'icon-add',title:'添加部门'"></div>
<div id="editGuruDialog" data-options="width:600,height:400,iconCls:'icon-add',title:'更新部门'"></div>