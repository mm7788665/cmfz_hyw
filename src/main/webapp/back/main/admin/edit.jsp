<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<div style="text-align: center;">
    <form id="editAdminInputForm" class="easyui-form" method="post">
        <div style="margin-top: 50px;">
            管理员: <input type="text" name="username" class="easyui-textbox" data-options="required:true,validType:'uname'" readonly value="${sessionScope.login.username}">
        </div>
        <div style="margin-top: 20px;">
            旧密码: <input type="text" name="password"  class="easyui-passwordbox" data-options="required:true">
        </div>
        <div style="margin-top: 20px;">
            新密码: <input type="text" name="password"  class="easyui-passwordbox" data-options="required:true">
        </div>
    </form>
</div>