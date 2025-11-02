<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang=ja>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>タイトル一覧</title>
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/view.css">
    <link rel="icon" href="static/images/r.ico">
</head> 
<body class="layui-view-body">
    <div class="layui-content">
        <div class="layui-page-header">
            <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a>タイトル検索</a>
                  <a><cite>タイトル一覧</cite></a>
                </span>
                <h2 class="title">タイトル一覧</h2>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-body">
					<table id="titleListTable" lay-filter="titleListTable">
						<!-- 検索結果のリスト -->
					</table>
                    <div class="layui-form-item">
						<label class="layui-form-label">&nbsp;</label>
						<button type="button" class="layui-btn layui-btn-blue" onclick="backToSelForm()">タイトル検索</button>
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
	        var titleList = <%= request.getAttribute("jsonTitleList")%>;
	        
	        // リストをレンダリングする
	        table.render({
	            elem: '#titleListTable',
	            cols: [[
	                {field: 'titleId', title: 'タイトルID', width: 200, sort: true},
	                {field: 'temCd', title: '商品コード', width: 200, sort: true},
	                {field: 'title', title: 'タイトル', minWidth: 200, sort: true},
	                {fixed: 'right', title: '操作', toolbar: '#detailBar', width: 80}
	            ]],
	            data: titleList, // タイトルリストデータ
	            skin: 'line', // テーブルスタイル
	            even: true,
	            page: true, // ページングを有効にする
	            limit: 10, // 一ページあたり10件で表示する
	            limits: [10,20,30]
	        });
	        table.reload('titleListTable');
	     	
			// テーブル内の操作イベントを監視する
	        table.on('tool(titleListTable)', function(obj) {
	            var data = obj.data;
	            if(obj.event === 'detail'){
	                // タイトル詳細情報ページに遷移し、タイトルIDパラメーターを渡す
	                window.location.href = 'toTitleSelDetails?titleId=' + data.titleId;
	            }
	        });
	    });
	    /*
			検索フォームに遷移する
		*/
		function backToSelForm() {
		    window.location.href = "${pageContext.request.contextPath}/titleSelForm";
		}
    </script>
    
    
    
</body>
</html>