<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>易租校园闲置物品租借平台</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/index.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/materialize.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.bundle.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
<link rel="stylesheet" href="<%=basePath%>css/detail.css" />
<style type="text/css">
#hr1{border-top: 5px solid #ff9966;
    border-top-width: 5px;
    border-top-style: solid;
    border-top-color: #ff9966;
    width: 110px;
    display: inline-block;}
   #zl{
   color:ee474a;
   }
 #zucebg{
 border-radius:20px;
position:absolute;
top:100px;
left:540px;
width:630px;
min-height:360px;
background-image:url(<%=basePath%>img/zuce.png);
background-repeat:no-repeat;
background-size:100% 100%;-moz-background-size:100% 100%;
 }
#loginbg{
border-radius:20px;
position:absolute;
left:540px;
width:630px;
min-height:330px;
background-image:url(<%=basePath%>img/login.png);
background-repeat:no-repeat;
background-size:100% 100%;-moz-background-size:100% 100%;
   }

#logform{
   width:300px;
   float:right; 
   margin-top:80px;
   }
#signup_form{
  width:300px;
   float:right; 
   margin-top:50px;
  }
#register{
margin-top:-10px;
margin-bottom:20px;
 margin-left:75px;
position:absolute;
width:200px;
  }
 #login_phone{
  background-color:#ffffff;
   height:30px;
  border-radius:20px;

  }
  #login_password{
  background-color:#ffffff;
    height:30px;
  border-radius:20px;
  }
 #zc_nickname{
   background-color:#ffffff;
  height:30px;
  border-radius:20px;
 }
 #zc_phone{
  background-color:#ffffff;
    height:30px;
  border-radius:20px;
 }
 #zc_psw{
   background-color:#ffffff;
    height:30px;
  border-radius:20px;
 }
</style>
<script>
       function showLogin() {
            if($("#signup-show").css("display")=='block'){
                $("#signup-show").css("display","none");
            }
            if($("#login-show").css("display")=='none'){
                $("#login-show").css("display","block");
            }else{
                $("#login-show").css("display","none");
            }
        }
        function showSignup() {
            if($("#login-show").css("display")=='block'){
                $("#login-show").css("display","none");
            }
            if($("#signup-show").css("display")=='none'){
                $("#signup-show").css("display","block");
            }else{
                $("#signup-show").css("display","none");
            }
        }
        function ChangeName() {
            if($("#changeName").css("display")=='none'){
                $("#changeName").css("display","block");
            }else{
                $("#changeName").css("display","none");
            }
        }
    </script>

<script type="text/javascript">
    
    function  addFocus(id) {
    	location.href = '<%=basePath%>user/addFocus/'+id
    	alert("已收藏成功，查看收藏列表~")
    	
    }
    
	/* 前往支付 */
    function  toPay(id) {
    	window.location.href = '<%=basePath%>goods/buyId/'+id
    }
	
    </script>
<body ng-view="ng-view">
	<!--

    描述：顶部
-->
<div ng-controller="headerController"
		class="header stark-components navbar-fixed ng-scope" style="background-color:#ff9966">
		<nav class="nav1">
			<div class="nav-wrapper">
				<a href="<%=basePath%>goods/homeGoods" class="logo"> <img  src="<%=basePath%>img/易物1.png" style="width:100px; hight:100px;"><em class="em2" style="color:#444444;position:absolute;">校园闲置物品租借平台</em> <em class="em3"></em>
				</a>
				<div class="nav-wrapper search-bar">
					<form class="ng-pristine ng-invalid ng-invalid-required"
						action="<%=basePath%>goods/search">
						<div class="input-field" >
							<input id="search" name="str" placeholder="搜点什么吧..."
								style="height:35px;width:250px;border-top-left-radius: 30px;border-bottom-left-radius:30px;position:absolute;left:50px;top:-7px;"/>
							<input type="submit" class="btn" value="" style="height:35px;border-top-right-radius: 30px;border-bottom-right-radius:30px;width:30px;position:absolute;background-color:#62abbb;left:300px;top:-7px"><img  src="<%=basePath%>img/search.png" style="width:25px; hight:25px;position:absolute;z-index:20000;left:315px;top:-2px;">
					            </input> 
<!-- 							<label
								for="search" class="active"> <i ng-click="search()"
								class="iconfont"></i>
							</label> -->
						</div>
					</form>
				</div>
				<ul class="right">
					<c:if test="${empty cur_user}">
						<li class="">
							<button onclick="showLogin()" data-toggle="tooltip"
								title="您需要先登录哦！"
								class="red" style="font-size:14px;background-color:#fddf75;height:36px;border-radius:10px;border:0px;font-color:#192c3f;box-shadow:0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);width:100px;text-align:center;">
								我要发布</button>
						</li>
					</c:if>
					<c:if test="${!empty cur_user}">
						<li class="" >
							<button data-position="bottom"
								class="red" style="background-color:#fddf75;height:36px;border-radius:10px;border:0px;font-color:#192c3f;box-shadow:0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);">
								<a href="<%=basePath%>goods/publishGoods" style="width:100px;text-align:center;color:#192c3f">我要发布</a>
							</button>
						</li>
						<li><a href="<%=basePath%>user/allGoods" style="">我发布的商品</a></li>
						<li><a>${cur_user.username}</a></li>
						<!-- <li class="notification">
                        <i ng-click="showNotificationBox()" class="iconfont"></i>
                    </li> -->
						<li class="changemore"><a class="changeMoreVertShow()"> <i
								class="iconfont"></i>
						</a>
							<div class="more-vert">
								<ul class="dropdown-content">
									<li><a href="<%=basePath%>user/home">个人中心</a></li>
									<li><a href="<%=basePath%>user/allFocus">我的收藏</a></li>
									<li><a onclick="ChangeName()">更改用户名</a></li>
								<%-- 	<li><a href="<%=basePath%>user/wx">粉丝列表</a></li> --%>
									<li><a href="<%=basePath%>user/logout">退出登录</a></li>
									
								</ul>
							</div></li>
					</c:if>
					<c:if test="${empty cur_user}">
						<li><a onclick="showLogin()" style="color:#192c3f">登录</a></li>
						<li><a onclick="showSignup()" style="color:#192c3f">注册</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>
	<!--

    描述：登录
-->
	<div ng-controller="loginController" class="ng-scope" >
		<div id="login-show" class="login stark-components" >
			<div class="publish-box z-depth-4" id="loginbg" >
				<div class="row" >
					<a onclick="showLogin()"> 
					<img src="<%=basePath%>img/close.png"
						width="20" style="margin:20px;"> 
					
					</a> 
					<form action="<%=basePath%>user/login" method="post" role="form" id="logform">
						<div class="input-field col s12">
							<input type="text" name="phone" id="login_phone"
								required="required" pattern="^1[0-9]{10}$"
								class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
							<label id="phone">&nbsp;&nbsp;手机&nbsp;&nbsp;
								<div id="login_errorPhone" style="color: red; display: inline;"></div>
							</label>
						</div>
						<div class="input-field col s12">
							<input type="password" id="login_password" name="password"
								required="required"
								class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
							<label>&nbsp;&nbsp;密码&nbsp;&nbsp;
								<div id="errorPassword" style="color: red; display: inline;"></div>
							</label>
							<!--   <a ng-click="showForget()" class="forget-btn">忘记密码？</a> -->
						</div>
						<button type="submit" id="loginIn"
							class="waves-effect waves-light btn login-btn red lighten-1">
							<i class="iconfont left"></i> <em>登录</em>
						</button>
						<div class="col s12 signup-area">
							<em style="color:#fafafa">没有账号？赶快</em> <a onclick="showSignup()" class="signup-btn">注册</a>
							<em style="color:#fafafa">吧！</em>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--

    描述：注册
-->
	<div ng-controller="signupController" class="ng-scope">
		<div id="signup-show" class="signup stark-components">
			<div class="publish-box z-depth-4" id="zucebg">
				<div class="row">
					<a onclick="showSignup()"> 
					<img src="<%=basePath%>img/close.png"
						width="20" style="margin:20px;"> 
					</a>
					<form action="<%=basePath%>user/addUser" method="POST" role="form"
						id="signup_form">
						<div class="input-field col s12">
							<input type="text" name="username" required="required" id="zc_nickname"
								class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
							<label>&nbsp;&nbsp;昵称</label>
						</div>
						<div class="input-field col s12">
							<input type="text" name="phone" id="zc_phone" required="required"
								pattern="^1[0-9]{10}$"
								class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
							<label>&nbsp;&nbsp;手机&nbsp;&nbsp;
								<div id="errorPhone" style="color: red; display: inline;"></div>
							</label>

						</div>
						<div class="input-field col s12">
							<input type="password" name="password" required="required" id="zc_psw"
								class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
							<label>&nbsp;&nbsp;密码</label>
						</div>
						<div ng-show="checkTelIsShow" class="col s12">
							<button type="submit" id="register"
								class="waves-effect waves-light btn verify-btn red lighten-1" >
								<i class="iconfont left"></i> <em>点击注册</em>
							</button>
						</div>
						<div ng-show="checkTelIsShow" class="login-area col s12" style="margin-top:20px;">
							<em style="color:#fafafa">已有账号？去</em> <a onclick="showLogin()">登录</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--更改用户名-->
	<div ng-controller="changeNameController" class="ng-scope">
		<div id="changeName" class="change-name stark-components">
			<div class="publish-box z-depth-4">
				<div class="row">
					<div class="col s12 title">
						<h1>修改用户名</h1>
					</div>
					<form:form action="../../user/changeName" method="post"
						commandName="user" role="form">
						<div class="input-field col s12">
							<input type="text" name="username" required="required"
								class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
							<label>修改用户名</label>
						</div>
						<div ng-show="checkTelIsShow" class="col s12">
							<button class="waves-effect waves-light btn publish-btn red lighten-1" style="width:150px;">
								<i class="iconfont left"></i> <em>确认</em>
							</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!--显示商品详情-->
	<div ng-controller="detailBoxController"
		class="detail-box stark-components z-depth-1 row ng-scope">
		<div class="col s12 path">
			<a href="<%=basePath%>goods/catelog/${catelog.id}">${catelog.name}</a>
			<em>></em> <a>${goodsExtend.goods.name}</a>
		</div>
		<div class="col s6">
			<div class="slider" style="height: 440px;">
				<ul class="slides" style="height: 400px;">
					<img src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}" />
				</ul>
				<ul class="indicators" style="display: none;">
					<li class="indicator-item"></li>
					<li class="indicator-item"></li>
					<li class="indicator-item"></li>
					<li class="indicator-item"></li>
				</ul>
			</div>
		</div>
		<div class="col s6">
			<h1 class="item-name">${goodsExtend.goods.name}</h1>

			<div class="item-public-info">

				<p>
					<i class="iconfont"></i> <em class="item-location">bnuz</em>
				</p>
			</div>
			<div class="publisher-info-title">
				<em>发布者信息</em>
				<hr>
			</div>
			<c:if test="${empty cur_user}">
				<div class="item-contact">
					<p class="not-login">
						<a onclick="showLogin()">登录</a> <em>或</em> <a
							onclick="showSignup()">注册</a> <em>后查看联系信息</em>
					</p>
				</div>
			</c:if>
			<c:if test="${!empty cur_user}">
				<div class="item-contact">
					<div>
						<div class="base-blue z-depth-1 attr">
							<i class="iconfont"></i>
						</div>
						<div class="value">${seller.username}</div>
					</div>
					<div>
						<div class="base-blue z-depth-1 attr">
							<i class="iconfont"></i>
						</div>
						<div class="value">${seller.phone}</div>
					</div>
					<div>
						<div class="base-blue z-depth-1 attr">
							<i class="iconfont"></i>
						</div>
						<c:if test="${seller.qq!=null}">
							<div class="value">${seller.qq}</div>
						</c:if>
						<c:if test="${seller.qq==null}">
							<div class="value">该同学没留下QQ</div>
						</c:if>

					</div>
					<div>

						<input type="button" value="收藏"
							class="red lighten-1 waves-effect waves-light btn" id="btn_cart"
							onclick="addFocus(${goodsExtend.goods.id})"></input>
						<c:if test="${cur_user.id==goodsExtend.goods.userId}">
							<input type="button" value="租赁" data-toggle="tooltip"
								title="不可以购买自己的东西哦~" disabled="disabled"
								class="blue lighten-1 waves-effect waves-light btn" id="btn_buy"></input>
						</c:if>
						<c:if
							test="${cur_user.id!=goodsExtend.goods.userId&&goodsExtend.goods.status==1}">
							<input type="button" value="租赁"
								class="blue lighten-1 waves-effect waves-light btn" id="btn_buy"
								onclick="toPay(${goodsExtend.goods.id})"></input>
						</c:if>
						<c:if
							test="${cur_user.id!=goodsExtend.goods.userId&&goodsExtend.goods.status==0}">
							<input type="button" value="正在租赁"
								class=" lighten-1 waves-effect waves-light btn" id="btn_buy" style="background-color:#fcb864"></input>
						</c:if>
					</div>

				</div>
			</c:if>
			<h1 class="item-pub-time">发布于 ${goodsExtend.goods.startTime}</h1>
		</div>
	</div>
	<div class="detail-box stark-components z-depth-1 row">
		<h1 class="title">商品描述</h1>
		<hr class="hr1" />
		<hr class="hr2" />
		<p class="section">描述：${goodsExtend.goods.describle}</p>
		<p class="section"></p>
		<p class="section">联系我的时候，请说明是在“易租校园闲置物品租借平台”上看见的哦~</p>
	</div>
	<div class="row detail-area">
		<div class="clo s12">
			<div ng-controller="commentController"
				class="comment stark-components z-depth-1 ng-scope">
				<h1 class="title">评论</h1>
				<hr class="hr1" />
				<hr class="hr2" />
				<c:forEach var="item" items="${CommentExtend.comments}">
					<div class="comment-collection">
						<div class="comment-item ng-scope">
							<div class="comment-main-content">
								<em class="name ng-binding">${item.user.username}:</em> <em
									class="ng-hide">回复</em> <em class="name ng-binding ng-hide">@:</em>
								<em class="ng-binding">${item.content}</em>
							</div>
							<div class="comment-function">
								<em class="time ng-biinding">${item.createAt}</em>

								<!--  <a class="reply-or-delete">删除</a>
                        <a class="reply-or-delete">回复</a> -->
							</div>
						</div>
					</div>
				</c:forEach>
				<form id="addCommentForm" class="form-horizontal">
					<div class="comment-add row">
						<div class="input-field col s12">
							<i class="iconfont prefix"></i> <input id="goodsId"
								name="goods.id" value="${goodsExtend.goods.id}" type="hidden" />
							<input id="commentbox" type="text" name="content"
								class="validate ng-pristine ng-untouched ng-valid ng-empty" /> <label
								for="commentbox">这里写下评论</label>
							<c:if test="${!empty cur_user}">
								<button type="button"
									class="waves-effect wave-light btn comment-submit"
									onclick="addComments()">确认</button>
							</c:if>
							<%--   <c:if test="${!empty cur_user} && ${cur_user.id!=goodsExtend.comments.userId}">
                    <button type="submit" class="waves-effect wave-light btn comment-submit">确认</button>
                    </c:if>
                     <c:if test="${!empty cur_user} && ${cur_user.id==goodsExtend.comments.userId}">
                    <button data-toggle="tooltip"  title="您已经评论过了哦！" disabled="disabled"  class="waves-effect wave-light btn comment-submit">确认</button>
                    </c:if> --%>
							<c:if test="${empty cur_user}">
								<button href="javacript:void(0);" data-toggle="tooltip"
									title="您需要先登录哦！" disabled="disabled"
									class="waves-effect wave-light btn comment-submit">确认</button>
							</c:if>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
/* 评论 */
function addComments(){
	$.ajax({
		url:'<%=basePath%>goods/addComments',
		type:'POST',
		data:$('#addCommentForm').serialize(),// 序列化表单值  
		dataType:'json',
	/* 	success:function(json){
			alert(1)
			alert(json.msg)
		},
		error:function(){
			alert('请求超时或系统出错!');
		} */
	});
	alert("您已评论成功~")
	window.location.reload();
}
</script>
</html>