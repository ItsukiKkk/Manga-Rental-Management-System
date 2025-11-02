<%@page import="com.seiryo.pojo.CustRegForm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="static/css/layui.css">
<link rel="stylesheet" href="static/css/view.css">
<link rel="icon" href="static/images/r.ico">
<title>在庫登録フォーム</title>
<style type="text/css">
	.layui-form-label {
		width:200px;
	}
	.layui-input {
		width:600px;
	}
	.noBorder {
	    border: none;
	    border-bottom: 1px solid #cccccc;
	    outline: none;
	}
</style>
</head>
<body class="layui-view-body">
	<div class="layui-content">
		<div class="layui-page-header">
            <div class="pagewrap">
                <h2 class="title">在庫登録</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">
				<div class="layui-card-header">フォーム</div>
				<form class="layui-form layui-card-body" action="" method="post">
					<!-- 
						タイトルID、タイトル、本数
					 -->
					<div class="layui-form-item">
						<label class="layui-form-label">タイトルID</label>
						<div class="layui-input-inline">
							<input type="text" name="titleId" class="layui-input noBorder" value="${title.titleId}" readonly/>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">タイトル</label>
						<div class="layui-input-inline">
							<input type="text" name="title" class="layui-input noBorder" value="${title.title}" readonly/>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">本数</label>
						<div class="layui-input-inline">
							<input type="text" name="insertNum"
								lay-verify="required|number|maxlength" placeholder="半角数字で入力してください"
								class="layui-input" maxlength="3" value="${insertNum}" >
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">&nbsp;</label>
						<div>
							<h3><font color="#149BD3">*入荷数を入力してください</font></h3>
						</div>
						
					</div>
					<div class="layui-form-item">					
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block">
							<button type="submit" class="layui-btn layui-btn-blue">確認</button>
							<button type="reset" class="layui-btn layui-btn-primary">リセット</button>
						</div>
					</div>
					<div class="layui-form-item" id="toMenuBtn">
						<label class="layui-form-label">&nbsp;</label>
						<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/stockRegForm">メインメニューへ</button>
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
			登録フォーム認証の処理
		*/
		$(document).ready(function() {
			// 全角数字を半角数字に変換する
			$('input[name="insertNum"]').on('input', function() {
			    var value = $(this).val();
			    var halfWidthValue = value.replace(/[０-９]/g, function(s) {
			        return String.fromCharCode(s.charCodeAt(0) - 65248);
			    });
			    if (value !== halfWidthValue) {
			        $(this).val(halfWidthValue);
			    }
			});
		    // submitイベント
		    $('form').submit(function(event) {
		        event.preventDefault();
		        var isValid = true;
		        // 検証
		        $(this).find('input[name="insertNum"]').each(function() {		        	
		            var value = $(this).val().trim();
		            if (value === '') {
		                layer.msg('本数を入力してください', {icon: 2});
		                isValid = false;
		                return false;
		            }
		        });
		        if (isValid) {
		            var formData = $(this).serialize();
		            var contextPath = "${pageContext.request.contextPath}";
		            $.ajax({
		            	async : true,
		                url: contextPath + '/toCheckInsertNum',
		                type: 'POST',
		                data: formData,
		                success: function(data) {
		                	if(data.overNum == false) {
		                		// 入荷数は在庫容量を超えない場合
		                		window.location.href = '${pageContext.request.contextPath}/toStockRegConfirm';
		                	} else {
		                		layer.confirm('入荷数が在庫容量（999）を超えます。<br>現在の在庫数は[' + data.nowStocks + ']です。<br>もう一度入力してください！', {
		                            title: '提示',
		                            btn: ['確認']
		                        }, function(index) {
		                            layer.close(index);
		                        });
		                	}
		                	
		                },
		                error: function(xhr, status, error) {
		                    console.error("エラー発生");
		                }
		            });
		        }
		    });
		});
		// resetボタン
		$(":reset").click(function(){
		　　$("input[name='insertNum']").val("");
		　　return false;
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