<%@page isELIgnored="false" pageEncoding="UTF-8" %>

<script>
    $(function () {

        //通过js创建datagrid
        $("#gurudg").datagrid({
            url:'${pageContext.request.contextPath}/banner/findAll',//用来请求远程数据
            pagination:true,//显示分页工具栏
            width:1300,
            height:700,
            toolbar:'#tb',//工具栏
            pageNumber:1,//当前页
            pageSize:5,//每页显示记录数
            pageList:[2,5,10,15,30,500],
            striped:true,//是否显示斑马线效果。
            rownumbers:true,//如果为true，则显示一个行号列。
            singleSelect:false,//如果为true，则只允许选择一行
            ctrlSelect:true,//在启用多行选择的时候允许使用Ctrl键+鼠标点击的方式进行多选操作。
            //checkOnSelect:false, 如果为true，当用户点击行的时候该复选框就会被选中或取消选中。如果为false，当用户仅在点击该复选框的时候才会呗选中或取消。

            //selectOnCheck:false, 如果为true，单击复选框将永远选择行。如果为false，选择行将不选中复选框。

            queryParams:{//在请求远程数据的时候发送额外的参数。
                name:"xiaohei",
            },
            remoteSort:false,//定义从服务器对数据进行排序。
            multiSort:true,//定义是否允许多列排序。（该属性自1.3.4版开始可用）
            columns:[[
                {title:'cks',field:"cks",checkbox:true},
                {title:'id',field:'id',width:120,},
                {title:'title',field:'title',width:120,},
                {title:'imgPfath',field:'imgPath',width:120,},
                {title:'status',field:'status',width:120,sortable:true},
                {title:'date',field:'date',width:120,sortable:true,},
                {title:'description',field:'description',width:120,},
                {title:'desc',field:'desc',width:120,},
                {title:'options',field:'options',width:200,
                    formatter:function(value,row,index){
                        return "<a href='javascript:;' class='options' onclick=\"delRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" +
                            "<a href='javascript:;' class='options' onclick=\"openEditTitlePicDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";
                    }
                }
            ]],

            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/'+ rowData.imgPath+ '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.title + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },


        });

    });

    //删除一行的事件
    function delRow(id){
        //获取当前点击id发送ajax请求删除id这个人的信息
        $.post("${pageContext.request.contextPath}/banner/delete",{"id":id},function (result) {//响应成功之后回调
            //刷新datagrid数据
            $("#gurudg").datagrid('reload');//刷新当前datagrid
        });
    }

    //打开保存用户对话框函数
    function openSaveTitlePicDialog(){
        $("#saveTitlePicDialog").dialog({
            <%--url:"${pageContext.request.contextPath}/back/main/banner/save.jsp",--%>
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#saveTitlePicInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/banner/save',
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            var resultObj=$.parseJSON(result);
                            if(resultObj.success){
                                //提示信息
                                $.messager.show({title:'提示',msg:"用户添加成功!!!"});
                            }else {
                                //提示信息
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }

                            //关闭对话框
                            $("#saveTitlePicDialog").dialog('close');
                            //刷新datagrid
                            $("#gurudg").datagrid('reload');
                        }
                    });
                }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#saveTitlePicDialog").dialog('close');
                }
            }]
        });
    }

    //打开修改用户的对话框
    function openEditTitlePicDialog(id){
        $("#editTitlePicDialog").dialog({
            href:'${pageContext.request.contextPath}/back/main/banner/edit.jsp?id='+id,
            buttons:[
                {
                    iconCls:'icon-save',
                    text:"修改",
                    handler:function(){
                        $("#saveTitlePicInputForm").form('submit',{
                            url:"${pageContext.request.contextPath}/banner/update",
                            success:function (result) {//注意一定是json字符串  使用需要转为js对象
                                //关闭dialog
                                $("#editTitlePicDialog").dialog('close');
                                //刷新datagrid
                                $("#gurudg").datagrid('reload');//刷新当前datagrid
                                //提示修改信息
                                $.messager.show({title:'提示',msg:"用户信息修改成功!!!"});
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:"取消",
                    handler:function(){
                        $("#editTitlePicDialog").dialog('close');
                    }
                },
            ]
        });

    }
    //批量删除多行
    function delBatchRows(){
        var rows = $("#gurudg").datagrid('getSelections');
        if(rows.length<=0){
            $.messager.show({title:'提示',msg:"至少选中一行!!!"});
        }else{
            var ids = [];
            for (var i = 0; i < rows.length ; i++) {
                console.log(rows[i].id);
                ids.push(rows[i].id);
            }
            console.log(ids);
            //发送ajax请求传递数组  注意: $.get $.post 只能传递简单数据(key=value) 不能数组类型的数据
            //                        如果想要传递数组类型的数据只能使用  $.ajax 并且还要设置其中的一个属性
            $.ajax({
                url:"${pageContext.request.contextPath}/banner/delete",
                type:"POST",
                traditional:true,//传递数据类型的数据时必须设置这个属性为true
                data:{id:ids},
                success:function(result){
                    //消息提示
                    $.messager.show({title:'提示',msg:"删除成功!!!"});
                    //刷新datagrid
                    $("#gurudg").datagrid('reload');
                },
                error:function(){
                    //消息提示
                    $.messager.show({title:'提示',msg:"删除失败!!!"});
                    //刷新datagrid
                    $("#gurudg").datagrid('reload');
                }
            })
        }
    }
</script>

<%--datagrid数据表格--%>
<table id="gurudg"></table>
<%--datagrid工具栏--%>
<div id="tb">
    <a href="#" class="easyui-linkbutton" onclick="openSaveTitlePicDialog();" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="#" class="easyui-linkbutton" onclick="delBatchRows();" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
</div>

<%--保存用户对话框--%>
<div id="saveTitlePicDialog"
     data-options="href:'${pageContext.request.contextPath}/back/main/banner/save.jsp',
         draggable:true,iconCls:'icon-save',width:600,height:400,title:'保存图片信息'">

</div>
<%--更新用户对话框--%>
<div id="editTitlePicDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新图片信息'">
</div>
