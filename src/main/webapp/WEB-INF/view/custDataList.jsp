<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang=ja>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会員統計</title>
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/view.css">
    <link rel="icon" href="static/images/r.ico">
</head> 
<body class="layui-view-body">
    <div class="layui-content">
        <div class="layui-page-header">
            <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a>会員管理</a>
                  <a><cite>会員統計</cite></a>
                </span>
                <h2 class="title">会員統計</h2>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-body">
					<table id="StatisticalListTable" lay-filter="StatisticalListTable">
						<!-- 検索結果のリスト -->
					</table>
                    <div class="layui-form-item">
						<label class="layui-form-label">&nbsp;</label>
						<button type="button" class="layui-btn layui-btn-blue" onclick="backToSelForm()">生成</button>
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
        <a class="layui-btn layui-btn-xs" lay-event="download">ダウロート</a>
    </script>
    
    <script>
	    layui.use(['form', 'table', 'layer', 'element'], function(){
	        var form = layui.form;
	        var table = layui.table;
	        var layer = layui.layer;
	        var element = layui.element;
	
	        // json形式の検索結果リストを取得する
	        var statisticalList = <%= request.getAttribute("jsonStatisticalList")%>;
	        
	        // リストをレンダリングする
	        table.render({
	            elem: '#StatisticalListTable',
	            cols: [[
	                {field: 'statisticalId', title: '統計ID', width: 200, sort: true},
	                {field: 'statisticalName', title: '統計名', width: 200, sort: true},
	                {field: 'statisticalURL', title: 'ファイルURL', minWidth: 100, sort: true},
	                {field: 'statisticalNumber', title: 'ダウロード回数', minWidth: 200, sort: true},
	                {fixed: 'right', title: '操作', toolbar: '#detailBar', width: 80}
	            ]],
	            data: statisticalList, // タイトルリストデータ
	            skin: 'line', // テーブルスタイル
	            even: true,
	            page: true, // ページングを有効にする
	            limit: 10, // 一ページあたり10件で表示する
	            limits: [10,20,30]
	        });
	        table.reload('StatisticalListTable');
	     	
			// テーブル内の操作イベントを監視する
	        table.on('tool(StatisticalListTable)', function(obj) {
	            var data = obj.data;
	            if(obj.event === 'download'){
// 	                // download data
// 	                window.location.href = 'toCustDownload?titleId=' + data.StatisticalName;
		 			// 从网页数据中获取文件名
// 				    const fileName = data.StatisticalDate+'.xlsx'; // 使用网页数据动态生成文件名
				    const fileName = data.statisticalName;
				    const encodedFileName = encodeURIComponent(fileName);
				    // 动态生成下载 URL
				    const url = 'toCustDownload?fileName='+encodedFileName+'&id='+data.statisticalId;
				    alert(url);
				    alert("开始下载:"+fileName);
				    // 创建一个隐藏的 <a> 标签触发下载
				    const link = document.createElement('a');
				    link.href = url; // 设置文件下载链接
				    link.download = fileName; // 设置默认下载文件名
				    document.body.appendChild(link); // 临时加入到页面中
				    link.click(); // 模拟点击触发下载
				    document.body.removeChild(link); // 移除临时的 <a> 标签
	        	};
	    	});
	    });
	    /*
			検索フォームに遷移する
		*/
		function backToSelForm() {
		    window.location.href = "${pageContext.request.contextPath}/toProduct";
		}
    </script>
    
    
    
</body>
</html>