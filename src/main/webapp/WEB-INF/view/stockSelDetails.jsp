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
    <title>在庫詳細画面</title>
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
                  <a>在庫検索</a>
                  <a>在庫一覧</a>
                  <a><cite>在庫詳細情報</cite></a>
                </span>
                <h2 class="title">在庫詳細情報</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header"></div>
					<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toStockUpdateForm" method="post">
						<input type="hidden" value="${stock.stockNo}" name="stockNo"/>
						<div class="layui-form-item">
							<label class="layui-form-label">タイトルID：</label>
							<div class="layui-input-inline">
								<input type="text" name="titleId" class="layui-input noBorder" value="${stock.titleId}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">タイトル：</label>
							<div class="layui-input-inline">
								<input type="text" name="title" class="layui-input noBorder" value="${stock.title.title}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">商品コード：</label>
							<div class="layui-input-inline">
								<input type="text" name="temCd" class="layui-input noBorder" value="${stock.title.temCd}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">主演：</label>
							<div class="layui-input-inline">
								<input type="text" name="actor" class="layui-input noBorder" value="${stock.title.actor}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">カテゴリー：</label>
							<div class="layui-input-inline">
								<input type="text" name="category" class="layui-input noBorder" value="${stock.title.category.category}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">在庫状況：</label>
							<div class="layui-input-inline">
								<input type="text" name="showStockState" class="layui-input noBorder" value="${stock.stockState == 0 ? '在庫有' : (stock.stockState == 1 ? '貸出中' : (stock.stockState == 9 ? 'その他' : ''))}" readonly/>
								<input type="hidden" name="stockState" class="layui-input noBorder" value="${stock.stockState}" />
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<button type="button" class="layui-btn layui-btn-blue" onclick = "toStockSelList()">在庫一覧</button>
							<button type="submit" class="layui-btn layui-btn-blue">更新</button> 
 							<button type="button" class="layui-btn layui-btn-blue" id="delBtn">削除</button>					
						</div>
						<div class="layui-form-item" id="toMenuBtn">
							<label class="layui-form-label">&nbsp;</label>
							<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/stockSelForm">メインメニュー</button>
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
	カテゴリー削除画面に遷移する
*/
$('#delBtn').click(function() {
    var stockState = $("input[name='stockState']").val();
    var stockNo = $("input[name='stockNo']").val();	
    var titleId = $("input[name='titleId']").val();	
    var contextPath = "${pageContext.request.contextPath}";
    $.ajax({
        async: true,
        url: contextPath + '/checkStockState?stockState=' + stockState,
        type: 'POST',
        success: function(data) {
            if (data.hasStock) {
                layer.confirm('貸出している削除できません。', {
                    title: '提示',
                    btn: ['確認']
                }, function(index) {
                	layer.close(index);
                });
                console.log("hasStock");
            } else {
            	window.location.href = "${pageContext.request.contextPath}/toStockDelConfirm?stockNo="+stockNo+"&titleId="+titleId;
            }
        },
        error: function(xhr, status, error) {
            console.error("エラー発生");
        }
    });
});
		/*
			タイトル一覧画面に遷移する
		*/
		function toStockSelList() {
			window.location.href = "${pageContext.request.contextPath}/toStockSelList";
		}
		/*
			メインメニューに遷移する
		*/
		function redirectToMainMenu() {
		    window.location.href = "${pageContext.request.contextPath}/topMenu";
		}
		
	</script>
</body>
</html>