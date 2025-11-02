<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/admin.css">
    <link rel="icon" href="static/images/r.ico">
	<title>漫画レンタル｜店員用</title>
</head>

<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header custom-header">
            
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item slide-sidebar" lay-unselect>
                    <a href="javascript:;" class="icon-font"><i class="ai ai-menufold"></i></a>
                </li>
            </ul>

            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">システムサービス</a>
                    <dl class="layui-nav-child">
                        <dd><a href="#">会員ログイン画面</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/toClerkLogin">ログアウト</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <div class="layui-side custom-admin">
            <div class="layui-side-scroll">
                <div class="custom-logo">
                    <img src="static/images/r.ico" alt=""/>
                    <h1>メニュー</h1>
                </div>
                	
                <div class="custom-logo"><h3 style="text-align: center;">店員名：${clerk.lastname}${clerk.firstname}</h3></div>
                <ul id="Nav" class="layui-nav layui-nav-tree">
                	<li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe68e;</i>
                            <em>TOP</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="${pageContext.request.contextPath}/topMenu">メニュー一覧</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe612;</i>
                            <em>会員管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="${pageContext.request.contextPath}/custRegForm">会員登録</a></dd>                            	
                            <dd><a href="${pageContext.request.contextPath}/custSelForm">会員検索</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/tocustDataList">会員統計</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>商品管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="${pageContext.request.contextPath}/titleRegForm">タイトル登録</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/titleSelForm">タイトル検索</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/stockSelForm">在庫検索</a></dd>
                        	<dd><a href="${pageContext.request.contextPath}/categoryRegForm">カテゴリー登録</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/categoryForm">カテゴリー検索</a></dd>
                        
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe665;</i>
                            <em>貸出・返却</em>
                        </a>
                        
                    </li>
                </ul>

            </div>
        </div>

        <div class="layui-body">
             <div class="layui-tab app-container" lay-allowClose="true" lay-filter="tabs">
                <ul id="appTabs" class="layui-tab-title custom-tab"></ul>
                <div id="appTabPage" class="layui-tab-content"></div>
            </div>
        </div>
        <div class="mobile-mask"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script>
    <script src="static/layui.js"></script>
    <script src="static/js/home.js"></script>
</body>

</html>