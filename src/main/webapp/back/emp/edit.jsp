<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#editUserInputForm").form('load','${pageContext.request.contextPath}/emp/queryOne?id=${param.id}');

    })
</script>
<div style="text-align: center;">
    <form id="editUserInputForm" class="easyui-form" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top: 70px;">
            名字: <input type="text" name="title"    class="easyui-textbox" >
        </div>
        <div style="margin-top: 20px;">
            图品路径: <input type="text" name="imgPath"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            排序:<input type="text" name="desc" class="easyui-textbox" data-options="required:true,">
        </div>
        <div style="margin-top: 20px;">
            状态: <input type="text" name="status"  class="easyui-datebox">
        </div>

    </form>
</div>