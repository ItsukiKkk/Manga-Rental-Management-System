<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang=ja>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>在庫一覧</title>
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/view.css">
    <link rel="icon" href="static/images/r.ico">
</head> 
<body class="layui-view-body">
    <div class="layui-content">
        <div class="layui-page-header">
            <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a>在庫検索</a>
                  <a><cite>在庫一覧</cite></a>
                </span>
                <h2 class="title">在庫一覧</h2>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-body">
					<table id="stockListTable" lay-filter="stockListTable">
						<!-- 検索結果のリスト -->
					</table>
                    <div class="layui-form-item">
						<label class="layui-form-label">&nbsp;</label>
						<button type="button" class="layui-btn layui-btn-blue" onclick="backToSelForm()">在庫検索</button>
					</div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="static/layui.all.js" charset='UTF-8'></script>
    <script src="static/js/home.js"></script>
    <!-- 操作列 -->
    <script type="text/html" id="detailBar">
        <a class="layui-btn layui-btn-xs" lay-event="detail">詳細</a>
    </script>
    
    <script>
	    layui.use(['form', 'table', 'layer', 'element'], function(){
	        var form = layui.form;
	        var table = layui.table;
	        var layer = layui.layer;
	        var element = layui.element;
	
	        // json形式の検索結果リストを取得する
	        var stockList = <%= request.getAttribute("jsonStockList")%>;
		    // 表示が必要なデータを処理する
	        var processedList = stockList.map(function(stock) {
	        	var stateTxt = '';
	        	switch(stock.stockState) {
	        		case 0:
	        			stateTxt = '在庫有';
	        			break;
	        		case 1:
	        			stateTxt = '貸出中';
	        			break;
	        		case 9:
	        			stateTxt = 'その他';
	        			break;
	        		default:
	        			stateTxt = '';
	        			break;
	        	}
	            return {
	            	titleId: stock.titleId, // titleId属性につける
	                title: stock.title.title,
	                temCd: stock.title.temCd,
	                actor: stock.title.actor,
	                category: stock.title.category.category,
	                stockNo: stock.stockNo,
	                stockState: stateTxt
	            };
	        });
	        // リストをレンダリングする
	        table.render({
	            elem: '#stockListTable',
	            cols: [[
	            	{field: 'titleId', title: 'タイトルID',width: 150 ,hide:true},
	            	{field: 'stockNo', title: 'ストック番号', width: 150, sort: true},
	                {field: 'title', title: 'タイトル', width: 250, sort: true},
	                {field: 'stockState', title: '在庫状況', width: 120, sort: true},
	                {field: 'temCd', title: '商品コード', minWidth: 150, sort: true},
	                {field: 'actor', title: '主演', width: 150, sort: true},
	                {field: 'category', title: 'カテゴリー', width: 150, sort: true},
	                {fixed: 'right', title: '操作', toolbar: '#detailBar', width: 80}
	            ]],
	            data: processedList, // ストックリストデータ
	            skin: 'line', // テーブルスタイル
	            even: true,
	            page: true, // ページングを有効にする
	            limit: 10, // 一ページあたり10件で表示する
	            limits: [10,20,30]
	        });
	        table.reload('stockListTable');
	     	
			// テーブルリスト内の操作イベントを監視する
	        table.on('tool(stockListTable)', function(obj) {
	            var data = obj.data;
	            if(obj.event === 'detail'){
	                // 在庫詳細情報画面に遷移し、タイトルIDと在庫番号ガパラメーターを渡す
	                window.location.href = '${pageContext.request.contextPath}/toStockSelDetails?titleId=' + data.titleId + '&stockNo=' + data.stockNo;
	            }
	        });
	    });
	    /*
			検索フォームに遷移する
		*/
		function backToSelForm() {
		    window.location.href = "${pageContext.request.contextPath}/stockSelForm" ;
		}
    </script>
    
    
    
</body>
</html>