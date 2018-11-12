<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}");
        $("#saveTitlePicInputForm").form('load','${pageContext.request.contextPath}/banner/update?id=${param.id}');
    })
</script>
<div style="text-align: center;">
    <form id="saveTitlePicInputForm" class="easyui-form" method="post">

           <input type="hidden" name="id" class="easyui-textbox" data-options="required:true,">

        <div style="margin-top: 70px;">
            标题: <input type="text" name="title" class="easyui-textbox" data-options="required:true,">
        </div>
        <div style="margin-top: 20px;">
            状态: <input type="text" name="status"  class="easyui-textbox">
        </div>


        <div style="margin-top: 20px;">
            描述: <input type="text" name="description"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            顺序: <input type="text" name="ordernum"  class="easyui-textbox">
        </div>
    </form>
</div>