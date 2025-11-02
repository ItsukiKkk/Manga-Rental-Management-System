<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会員検索フォーム</title>
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/view.css">
    <link rel="icon" href="static/images/r.ico">
    <style type="text/css">
        .layui-form-label {
            width:250px;
        }
        .layui-input {
            width:500px; 
        }
    </style>
</head>    
<body class="layui-view-body">
    <div class="layui-content">
        <div class="layui-page-header">
            <div class="pagewrap">
                <h2 class="title">会員検索</h2>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header">フォーム</div>
                    <form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toCustSelList" method="get">
                        <div class="layui-form-item">
                            <div class="layui-form-label">会員ID:</div>
                            <div class="layui-input-inline">
                                <input type="text" autocomplete="off" lay-verify="maxlength" maxlength="8" placeholder="8桁整数で入力してください" class="layui-input" name="memId">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-label">姓：</div>
                            <div class="layui-input-inline">
                                <input type="text" autocomplete="off" lay-verify="maxlength" maxlength="20" placeholder="部分一致検索" class="layui-input" name="lastname">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-label">名：</div>
                            <div class="layui-input-inline">
                                <input type="text" autocomplete="off" lay-verify="maxlength" maxlength="20" placeholder="部分一致検索" class="layui-input" name="firstname">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-label">姓カナ：</div>
                            <div class="layui-input-inline">
                                <input type="text" autocomplete="off" lay-verify="maxlength" maxlength="40" placeholder="部分一致検索" class="layui-input" name="lastkana">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-label">名カナ：</div>
                            <div class="layui-input-inline">
                                <input type="text" autocomplete="off" lay-verify="maxlength" maxlength="40" placeholder="部分一致検索" class="layui-input" name="firstkana">
                            </div>
                        </div>
                        <div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<label class="layui-form-label"><font color="#149BD3">未入力時は会員一覧を表示します。</font></label>
						</div>
                        <div class="layui-form-item">
                            <div class="layui-form-label">&nbsp;</div>
                            <div class="layui-input-inline">
                                <button type="submit" class="layui-btn layui-btn-blue">検索</button>
                                <button type="reset" class="layui-btn layui-btn-primary">リセット</button>
                            </div>
                        </div>
                        <div class="layui-form-item" id="toMenuBtn">
							<label class="layui-form-label">&nbsp;</label>
							<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/custSelForm">メインメニュー</button>
						</div>
                    </form>
                </div>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="static/layui.all.js"></script>
    <script src="static/js/home.js"></script>
    <script>
	    /*
			検索フォーム認証
		*/
		$(document).ready(function() {
		    $('form').submit(function(event) {
	            event.preventDefault();
	            layer.confirm('検索を行いますか？', {
	                title: '条件確認',
	                btn: ['はい', 'いいえ']
	            }, function(index){
	                $('form').unbind('submit').submit();
	                layer.close(index);
	            }, function(){
	                // 「いいえ」の場合、操作なし
	            });
		    });
		 	// 会員ID
		    $('input[name="memId"]').blur(function() {
		        var value = $(this).val();
		     	// 全角数字を半角数字に転換する
		        value = value.replace(/[０-９]/g, function(s) {
		            return String.fromCharCode(s.charCodeAt(0) - 65248);
		        });
		        $(this).val(value);
		        // 入力なし、または8桁数の半角数字
		        if (!(value === '' || /^\d{8}$/.test(value))) {
		            layer.msg('会員Idが8桁数の半角数字で入力してください', {icon: 2});
		            $(this).val('');
		        }
		    });

		    // 氏名
		    $('input[name="lastname"], input[name="firstname"]').blur(function() {
		        var value = $(this).val();
		        if (value.length > 20) {
		            layer.msg('姓、名は20桁数以内で入力してください', {icon: 2});
		            $(this).val(value.substring(0, 20));
		        }
		    });

		    // 氏名カナ
		    $('input[name="lastkana"], input[name="firstkana"]').blur(function() {
		        var value = $(this).val();
		        var pattern = /^[\u30A1-\u30F6]*$/;
		        if (!pattern.test(value) || value.length > 40) {
		            layer.msg('姓、名カナは全角カタカナ40桁数以内で入力してください', {icon: 2});
		            $(this).val('');
		        }
		    });
		});
		    

		/*
			メインメニューに遷移する
		*/
		function redirectToMainMenu() {
		    window.location.href = "${pageContext.request.contextPath}/topMenu";
		}
		
	</script>
</body>
</html>