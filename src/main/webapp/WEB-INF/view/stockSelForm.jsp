<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>在庫検索フォーム</title>
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
                <h2 class="title">在庫検索</h2>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header">フォーム</div>
                    <form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toStockSelList" method="post">
                        <div class="layui-form-item">
                            <div class="layui-form-label">タイトル</div>
                            <div class="layui-input-inline">
                                <input type="text" lay-verify="maxlength" maxlength="100" class="layui-input" name="title" value="${selStockTitle.title }" placeholder="*部分一致検索">
                                <input type="hidden" lay-verify="maxlength" maxlength="100" class="layui-input" name="titleId" value="">
                            	<span class="errorSpan" id="titleError" style="color: red;"></span>
                            </div>
                            
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-label">商品コード</div>
                            <div class="layui-input-inline">
                                <input type="text" lay-verify="maxlength" maxlength="13" class="layui-input" name="temCd" value="${selStockTitle.temCd }" placeholder="13桁までの整数で入力してください（*部分一致検索）">
                            	<span class="errorSpan" id="temCdError" style="color: red;"></span>
                            </div>
                            
                        </div>
                        <div class="layui-form-item">
						    <label class="layui-form-label">カテゴリー</label>
						    <div class="layui-input-inline" style="display: flex; align-items: center; ">
					        <select name="ctgCd" lay-verify="required|optional" id="ctgCd" >
					        	<option value="" ${"".equals(selStockTitle.ctgCd) ? 'selected' : '' }>選択なし</option>
					            <!-- 「カテゴリー」を動的に生成 -->
					            <c:forEach items="${categoryList}" var="category">
							        <option value="${category.categoryCd}" ${category.categoryCd == selStockTitle.ctgCd ? 'selected' : '' }>${category.category}</option>
							    </c:forEach>
					        </select>
					    </div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">主演</label>
							<div class="layui-input-inline">
								<input type="text" name="actor" 
									lay-verify="required|maxlength" placeholder="*部分一致検索" class="layui-input" maxlength="100" value="${selStockTitle.actor}">
							</div>
						</div>
                        <div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<label class=""><font color="#149BD3">*未入力時は在庫一覧を表示します。</font></label>
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
	            $(this).find('input[name="temCd"]').each(function() {
		            var value = $(this).val().trim();	
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
		$(":reset").click(function(){
    		var resetArr = $(this).parents("form").find(":text, select");
    	　　for(var i=0; i<resetArr.length; i++){
    	　　　　resetArr.eq(i).val("");
    	　　}
    		$(".errorSpan").text('');
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