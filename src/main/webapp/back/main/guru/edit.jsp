<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        //console.log("${param.id}");
        $("#editCarForm").form('load','${pageContext.request.contextPath}/guru/findOne?id=${param.id}'); //{"id":"21","name":"小黑"}
    })
</script>
<div style="text-align: center;">
    <form id="editGuruForm" class="easyui-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            上师姓名: <input type="text" name="name" class="easyui-textbox" data-options="required:true,prompt:'title'">
        </div>
        <div style="margin-top: 20px;">
            上师性别: <input type="text" name="gender"  class="easyui-textbox" data-options="required:true,prompt:'title'">
        </div>
        <div style="margin-top: 20px;">
            上师头像: <input type="text" name="file"  class="easyui-filebox" data-options="required:true,buttonAlign:'left'">
        </div>

    </form>
</div>