<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>タイトル検索フォーム</title>
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/view.css">
    <link rel="icon" href="static/images/r.ico">
    <style type="text/css">
        .layui-form-label {
            width:200px;
        }
        .layui-input {
			width:600px;
		}
    </style>
</head>    
<body class="layui-view-body">
    <div class="layui-content">
        <div class="layui-page-header">
            <div class="pagewrap">
                <h2 class="title">タイトル検索</h2>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header">フォーム</div>
                    <form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toTitleSelList" method="post">                    	
                        <div class="layui-form-item">
                            <div class="layui-form-label">タイトルID:</div>
                            <div class="layui-input-inline">
                                <input type="text" lay-verify="maxlength" maxlength="8" class="layui-input" name="titleId" value="${selTitle.titleId }" placeholder="8桁整数で入力してください（*完全一致検索）">
                            	<span class="errorSpan" id="titleIdError" style="color: red;"></span>
                            </div>
                            
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-label">タイトル名：</div>
                            <div class="layui-input-inline">
                                <input type="text" lay-verify="maxlength" maxlength="100" class="layui-input" name="title" value="${selTitle.title }" placeholder="100文字以内で入力してください（*部分一致検索）">
                            	<span class="errorSpan" id="titleError" style="color: red;"></span>
                            </div>
                            
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-label">商品コード：</div>
                            <div class="layui-input-inline">
                                <input type="text" lay-verify="maxlength" maxlength="13" class="layui-input" name="temCd" value="${selTitle.temCd }" placeholder="13桁までの整数で入力してください（*部分一致検索）">
                            	<span class="errorSpan" id="temCdError" style="color: red;"></span>
                            </div>
                            
                        </div>
                        <div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<label class=""><font color="#149BD3"><h3>*未入力時はタイトル一覧を表示します。</h3></font></label>
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
							<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/titleSelForm">メインメニュー</button>
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
			$('input[name="titleId"], input[name="temCd"]').on('input', function() {
			    var value = $(this).val();
			    var halfWidthValue = value.replace(/[０-９]/g, function(s) {
			        return String.fromCharCode(s.charCodeAt(0) - 65248);
			    });
			    if (value !== halfWidthValue) {
			        $(this).val(halfWidthValue);
			    }
			});
			
		 	// タイトルID
		    $('input[name="titleId"]').on('keyup blur input',function() {
		        var value = $(this).val();		     	
		        // 入力なし、または8桁数の半角数字
		        if (!(value === '' || /^\d{8}$/.test(value))) {
		            $('#titleIdError').text('*8桁の半角数字');
		        } else {
		            $('#titleIdError').text('');
		        }
		    });

		    // タイトル
		    $('input[name="title"]').on('keyup blur input',function() {
		        var value = $(this).val();
		        if (value.length > 100) {
		        	$('#titleError').text('*100文字以内');
		        } else {
		            $('#titleError').text('');
		        }
		    });

		    // 商品コード
		    $('input[name="temCd"]').on('keyup blur input',function() {
		        var value = $(this).val();		     	
		        // 
		        if (!(value === '' || /^\d{1,13}$/.test(value))) {
		            $('#temCdError').text('*半角数字で最大13桁');
		        } else {
		            $('#temCdError').text('');
		        }
		    });
		    // submitイベント
		    $('form').submit(function(event) {
	            event.preventDefault();
	            var flag = true;
	            // 再検証
	            $(this).find('input[name="titleId"], input[name="temCd"]').each(function() {
		            var value = $(this).val().trim();		          
		            // タイトルID
		            if ($(this).attr('name') === 'titleId') {
		            	// 全角数字を半角数字に転換する
		                value = value.replace(/[０-９]/g, function(s) {
		                    return String.fromCharCode(s.charCodeAt(0) - 65248);
		                });
		                $(this).val(value);
		                if (!(value === '' || /^\d{8}$/.test(value))) {
		                    layer.msg('タイトルIDが8桁数の半角数字で入力してください', {icon: 2});
		                    flag = false;
		                    return false;
		                }
		            }
		         	// 商品コード
		            if ($(this).attr('name') === 'temCd') {
		            	// 全角数字を半角数字に転換する
		                value = value.replace(/[０-９]/g, function(s) {
		                    return String.fromCharCode(s.charCodeAt(0) - 65248);
		                });
		                $(this).val(value);
		                if (!(value === '' || /^\d{1,13}$/.test(value))) {
		                    layer.msg('商品コードが半角数字で入力してください（最大13桁）', {icon: 2});
		                    flag = false;
		                    return false;
		                }
		            }
		        });
	            if (flag) {
	            	layer.confirm('検索を行いますか？', {
		                title: '条件確認',
		                btn: ['はい', 'いいえ']
		            }, function(index){
		                $('form').unbind('submit').submit();
		                layer.close(index);
		            }, function(){
		                // 「いいえ」の場合、操作なし
		            });
	            }
		    });
		});
		
	</script>
</body>
</html>