<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/view.css">
    <link rel="icon" href="static/images/r.ico">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>タイトル詳細画面</title>
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
                <span class="layui-breadcrumb">
                  <a>タイトル検索</a>
                  <a>タイトル一覧</a>
                  <a><cite>タイトル詳細情報</cite></a>
                </span>
                <h2 class="title">タイトル詳細情報</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header"></div>
					<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toTitleUpdateForm" method="post">
						<div class="layui-form-item">
							<label class="layui-form-label">タイトルID：</label>
							<div class="layui-input-inline">
								<input type="text" name="titleId" class="layui-input noBorder" value="${title.titleId}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">タイトル：</label>
							<div class="layui-input-inline">
								<input type="text" name="title" class="layui-input noBorder" value="${title.title}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">商品コード：</label>
							<div class="layui-input-inline">
								<input type="text" name="temCd" class="layui-input noBorder" value="${title.temCd}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">カテゴリー：</label>
							<div class="layui-input-inline">
								<input type="text" name="category" class="layui-input noBorder" value="${title.category.category}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">主演：</label>
							<div class="layui-input-inline">
								<input type="text" name="actor" class="layui-input noBorder" value="${title.actor}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
								<button type="submit" class="layui-btn layui-btn-blue">更新</button>
								<button type="button" class="layui-btn layui-btn-blue" id="delBtn">削除</button>
								<button type="button" class="layui-btn layui-btn-blue" id="toStockBtn">入荷</button>							
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							
							<button type="button" class="layui-btn layui-btn-primary" id="toSelListBtn">タイトル一覧</button>
						</div>					
					</form>
				</div>
			</div>
		</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="static/layui.all.js"></script>	
	<script src="static/js/home.js"></script>
	<script>
		$(document).ready(function() {
			/*
				タイトル削除画面に遷移する
			*/
			$('#delBtn').click(function() {
		        var titleId = $("input[name='titleId']").val();	
		        var contextPath = "${pageContext.request.contextPath}";
		        $.ajax({
		            async: true,
		            url: contextPath + '/checkStock?titleId=' + titleId,
		            type: 'POST',
		            success: function(data) {
		                if (data.hasStock) {
		                    layer.confirm('在庫が存在するため削除できません。<br/>在庫数を0にしてから在庫の削除を行ってください。', {
		                        title: '提示',
		                        btn: ['確認']
		                    }, function(index) {
		                    	layer.close(index);
		                    });
		                    console.log("hasStock");
		                } else {
		                	window.location.href = "${pageContext.request.contextPath}/toTitleDelConfirm?titleId=" + titleId;
		                }
		            },
		            error: function(xhr, status, error) {
		                console.error("エラー発生");
		            }
		        });
		    });
			/*
				在庫登録画面に遷移する
			*/
			$('#toStockBtn').click(function() {
				var titleId = $("input[name='titleId']").val();
			    window.location.href = "${pageContext.request.contextPath}/toStockRegForm?titleId="+ titleId;
			});
			/*
				タイトル一覧画面に遷移する
			*/
			$('#toSelListBtn').click(function() {
			    window.location.href = "${pageContext.request.contextPath}/toTitleSelList";
			});
			/*
				エラーメッセージ
			*/
			var errorMsg = "${errorMsg}";
		    if (errorMsg) {
		        layer.msg(errorMsg);
		    }
		});	
		
	</script>
</body>
</html>