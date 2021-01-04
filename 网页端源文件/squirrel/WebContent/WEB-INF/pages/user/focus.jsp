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
<meta charset="UTF-8">
<title>我的关注</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/emoji.css" />
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />
<!-- bootstrap -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/index.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/materialize.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.bundle.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />
<style type="text/css">
#hr1{border-top: 5px solid #52c7ca;
    border-top-width: 5px;
    border-top-style: solid;
    border-top-color: #52c7ca;
    width: 100%;
 display: inline-block; 
   margin-top:20px;
     margin-bottom:20px;
    }

#home_header{
background-color:#ff9966;
width:100%;
right:1.5px;
margin:0px;
padding:0px;

}
#top{
margin-left:150px;
}
#user_content{
margin-top:0px;
}
#user_nav{
margin-top:0px;
}
</style>

</head>
<body>
<div class="pre-2" id="big_img">
		
	</div>
	<div id="cover" style="min-height: 663px;">
	
		<div id="user_area">
		
			<div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope" id="logbg">
		<nav class="nav1">
			<div class="nav-wrapper">
			<div id="home_header">
			<a href="<%=basePath%>goods/homeGoods" id="top" > <img  src="<%=basePath%>img/易物1.png" style="width:100px; hight:100px;"><em class="em2" style="color:#444444;position:absolute;font-size: 28px;font-family:'Microsoft YaHei','微软雅黑';
    font-weight: bolder;">校园闲置物品租借平台</em> <em class="em3"></em>
				</a>
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
			
			</div>
		</nav>
	</div>
			<!--

            描述：左侧个人中心栏
        -->
			<div id="user_nav">
				<div class="user_info">
					<a href="<%=basePath%>user/home">
					<div class="head_img">
						<img src="<%=basePath%>img/photo.jpg">
					</div></a>
					<div class="big_headimg">
						<img src="">
					</div>
					<span class="name">${cur_user.username}</span>
					<hr>
					<!--   <span class="school">莆田学院</span> -->

					<input type="hidden" value="${myPurse.recharge}" id="recharge" /> <input
						type="hidden" value="${myPurse.withdrawals}" id="withdrawals" /> <span
						class="btn" data-toggle="modal" data-target="#myModal"
						style="width: 98%; background-color: rgb(79, 190, 246); color: rgba(255, 255, 255, 1); margin-top: 0.5cm;">我的信用积分：${cur_user.power}</span>

				</div>
				<div class="home_nav">
					<ul style="min-height:300px;">
						<a href="<%=basePath%>user/wx">
							<li class="fri">
								<div></div> <span>粉丝列表</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>orders/myOrders">
							<li class="notice">
								<div></div> <span>订单中心</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/allFocus">
							<li class="fri">
								<div></div> <span>收藏列表</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>goods/publishGoods">
							<li class="store">
								<div></div> <span>发布物品</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/allGoods">
							<li class="second">
								<div></div> <span>我的闲置</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/basic">
							<li class="set">
								<div></div> <span>个人设置</span> <strong></strong>
						</li>
						</a>
	
		
					</ul>
				</div>
			</div>
			<!--

            描述：右侧内容区域
        -->
			<div id="user_content">
				<div class="share">
					<!--

                    描述：关注商品展示
                -->
					<h1 style="text-align: center;font-size:24px;color:#333333">收藏列表</h1>
					<hr />
					<div class="share_content">
						<c:if test="${empty goodsAndImage}">
							<div class="no_share">
								<span>没有任何内容，去逛逛其它的吧！</span>
							</div>
						</c:if>
						<c:if test="${!empty goodsAndImage}">
							<c:forEach var="items" items="${goodsAndImage}">
								<div class="story">
									<a href="<%=basePath%>goods/goodsId/${items.goods.id}"
										class="head_img"> <img
										src="../upload/${items.images[0].imgUrl}">
									</a> <span class="name" style="margin-left: 30px;">${items.goods.name}</span>
									<span class="text" style="overflow: hidden; outline: none;">${items.goods.describle}</span>
									<div class="box">
										<div class="box_content">
											<div class="left_shadow"></div>
											<div class="left" index="1" style="display: none;"><</div>
											<div class="right_shadow"></div>
											<div class="left" index="3" style="display: none;">></div>
											<img src="../upload/${items.images[0].imgUrl}" index="2">
											<span class="com" style="display: none; left: 396.733px;"></span>
										</div>
										<div class="interact">
											<c:if test="${items.goods.status==1}">
												<span class="fa fa-heart fa-lg "><a
													href="<%=basePath%>goods/goodsId/${items.goods.id}">前往查看</a></span>
											</c:if>
											<c:if test="${items.goods.status==0}">
												<span class="fa fa-heart fa-lg"><a href="#">尚未归还</a></span>
											</c:if>
											<span class="fa fa-heart-o fa-lg"><a
												href="<%=basePath%>user/deleteFocus/${items.goods.id}">取消收藏</a></span>
										</div>
										<br>
										<div class="like_detail">
											<div class="like_content">
												<span>下架时间：${items.goods.endTime}</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				

                <!----描述：最右侧，可能认识的人-->
<%--             
            <div class="recommend">
                <div class="title">
                    <span class="text">可能认识的人</span>
                    <span class="change">换一组</span>
                    <span class="underline"></span>
                </div>
                <ul>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo1.jpg">
                        </a>
                        <span>Brudce</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo2.jpg">
                        </a>
                        <span>Graham</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo3.jpg">
                        </a>
                        <span>策马奔腾hly</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo4.jpg">
                        </a>
                        <span>Danger-XFH</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo5.jpg">
                        </a>
                        <span>Keithw</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                </ul>
            </div> --%>
             <!----描述：最右侧，可能认识的人-->
			</div>
		</div>
	</div>
</body>
</html>