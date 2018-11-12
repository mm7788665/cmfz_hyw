<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        //console.log("${param.id}");
        $("#editAlbumForm").form('load','${pageContext.request.contextPath}/carousel/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}
    })
</script>
<div style="text-align: center;">
    <form id="editAlbumForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            图片标题: <input type="text" name="title" class="easyui-textbox" data-options="required:true,prompt:'title'">
        </div>
        <div style="margin-top: 20px;">
            图片描述: <input type="text" name="dese"  class="easyui-textbox" data-options="required:true,prompt:'title'">
        </div>
        <div style="margin-top: 20px;">
            图片状态: <input type="text" name="status"  class="easyui-textbox" data-options="required:true,prompt:'yes or no'">
        </div>
        <div style="margin-top: 20px;">
            添加时间: <input type="text" name="createDate"  class="easyui-datebox">
        </div>

    </form>
</div>