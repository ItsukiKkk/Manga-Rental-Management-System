<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/login.css">
    <link rel="icon" href="static/images/r.ico">    
    <title>漫画レンタル｜店員ログイン</title>
</head>
<body class="login-wrap">
    <div class="login-container">
    	<h2 style="text-align: center;">ログイン画面｜店員用</h2>
        <form class="login-form" action="clerkLogin" id="clerkLogin" method="post" onsubmit="return checkForm()">
        	<span id="msg" style="color:red">${msg}</span>
            <div class="input-group">
                <input type="text" id="clerkId" lay-verify="required|number|maxlength" class="input-field" name="clerkId" maxlength=5>
                <label for="clerkId" class="input-label">
                    <span class="label-title">ID</span>
                </label>
            </div>
            <div class="input-group">
                <input type="password" id="password" lay-verify="required|maxlength" class="input-field" name="password" maxlength=20>
                <label for="password" class="input-label">
                    <span class="label-title">パスワード</span>
                </label>
            </div>
            <button type="submit" class="login-button">ログイン<i class="ai ai-enter"></i></button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script>
    <script src="static/layui.js"></script>
    <script src="static/js/login.js"></script>
    <script>
	    $(function(){
	    	// 会員ID入力，全角数字を半角数字に変換する
			$('input[name="clerkId"]').on('input', function() {
			    var value = $(this).val();
			    var halfWidthValue = value.replace(/[０-９]/g, function(s) {
			        return String.fromCharCode(s.charCodeAt(0) - 65248);
			    });
			    if (value !== halfWidthValue) {
			        $(this).val(halfWidthValue);
			    }
			});
	    	
	    });
        function checkForm() {
            var id = $("#clerkId").val();
            var password = $("#password").val();
            if (!id || !password) {
                $("#msg").html("IDとパスワードを入力してください！");
                return false;
            }
            var idPattern = /^\d{3}$/;
            var passwordPattern = /^[\w\d]{1,20}$/;
            if (!idPattern.test(id)) {
                $("#msg").html("IDは3桁の半角数字で入力してください！");
                return false;
            }
            if (!passwordPattern.test(password)) {
                $("#msg").html("パスワードは20桁以内の数字または英文字で入力してください！");
                return false;
            }
            $("#msg").html("");
            return true;
        }
    </script>
</body>
</html>
