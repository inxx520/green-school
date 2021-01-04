<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>订单中心</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
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
<script type="text/javascript">

		function ordersDeliver(orderNum){
	
		location.href ='<%=basePath%>orders/deliver/'+orderNum
	
		alert("成功出租，请等待买家归还！")
	}
		
		function ordersReceipt(orderNum,goodsId){
			location.href ='<%=basePath%>orders/receipt?orderNum='+orderNum+'&goodsId='+goodsId;  
			
			alert("成功归还！感谢您的使用~")
		}
	

</script>

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

                    描述：订单展示
                -->
					<h1 style="text-align: center;font-size:24px;color:#333333">订单中心</h1>
					<hr />
					<div class="share_content">
						<c:if test="${empty orders and empty ordersOfSell}">
							<div class="no_share">
								<span>没有任何内容，去逛逛其它的吧！</span>
							</div>
						</c:if>
						<c:if test="${!empty orders or !empty ordersOfSell}">
							<div class="story">

								<div class="container" style="width:100%;padding:30px;border-radius:10px">
									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist" style="width:100%">
										<!-- <li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home">全部订单</a></li> -->
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#orders_my">我的租赁</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#orders_other">我的出租</a></li>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content" style="width: 100%">
										<!-- <div id="home" class="container tab-pane active"
										style="width: 100%">
										<br>
										<from>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua.</p>
										</from>
									</div> -->
										<!-- 租赁订单中心 -->
										<div id="orders_my" class="container tab-pane active"
											style="width: 100%">
											<br>
											<form class="form-horizontal" role="form">
												<div class="table-responsive">
													<table class="table">
														<thead>
															<tr>
															</tr>
															<tr>
																<th>订单编号</th>
																<th>名称</th>

																<th>备注</th>
																<th>操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="items" items="${orders}">
																<tr>
																	<td>${items.orderNum}</td>
																	<td>${items.goods.name}</td>

																	<td>${items.orderInformation}</td>
																	<td><c:if test="${items.orderState==1}">
																			<input type="button" value="等待主人确定"
																				class="btn btn-info" style="background-color:#a83937"/>
																		</c:if> <c:if test="${items.orderState==2}">
																			<input type="button" value="归还"
																				onclick="ordersReceipt(${items.orderNum},${items.goods.id})"
																				class="btn btn-info"  style="background-color:#52a292"/>
																		</c:if> <c:if test="${items.orderState==3}">
																			<input type="button" value="已完成" class="btn btn-info" style="background-color:#ffba63"/>
																		</c:if></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>

											</form>
										</div>
										<!-- 卖家订单中心 -->
										<div id="orders_other" class="container tab-pane fade"
											style="width: 100%">
											<br>
											<form class="form-horizontal" role="form">
												<div class="table-responsive">
													<table class="table">
														<thead>
															<tr>
															</tr>
															<tr class="text-center">
																<th>订单编号</th>
																<th>名称</th>

																<th>备注</th>
																<th>操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="items" items="${ordersOfSell}">
																<tr>
																	<td>${items.orderNum}</td>
																	<td>${items.goods.name}</td>

																	<td>${items.orderInformation}</td>
																	<td><c:if test="${items.orderState==1}">
																			<input type="button" value="同意"
																				onclick="ordersDeliver(${items.orderNum})"
																				class="btn btn-info" style="background-color:#52a292" />
																		</c:if> <c:if test="${items.orderState==2}">
																			<input type="button" value="待归还" class="btn btn-info"style="background-color:#a83937" />
																		</c:if> <c:if test="${items.orderState==3}">
																			<input type="button" value="已完成" class="btn btn-info" style="background-color:#ffba63"/>
																		</c:if></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>

											</form>
										</div>
									</div>
								</div>
							</div>

						</c:if>
					</div>
				</div>
				<!--

                描述：最右侧，可能认识的人
            
				<div class="recommend">
					<div class="title">
						<span class="text">可能认识的人</span> <span class="change">换一组</span> <span
							class="underline"></span>
					</div>
					<ul>
						<li><a href="" class="head_img"> <img
								src="<%=basePath%>img/photo1.jpg">
						</a> <span>Brudce</span>
							<div class="fa fa-plus-square"></div></li>
						<li><a href="" class="head_img"> <img
								src="<%=basePath%>img/photo2.jpg">
						</a> <span>Graham</span>
							<div class="fa fa-plus-square"></div></li>
						<li><a href="" class="head_img"> <img
								src="<%=basePath%>img/photo3.jpg">
						</a> <span>hly</span>
							<div class="fa fa-plus-square"></div></li>
						<li><a href="" class="head_img"> <img
								src="<%=basePath%>img/photo4.jpg">
						</a> <span>Danger-XFH</span>
							<div class="fa fa-plus-square"></div></li>
						<li><a href="" class="head_img"> <img
								src="<%=basePath%>img/photo5.jpg">
						</a> <span>Keithw</span>
							<div class="fa fa-plus-square"></div></li>
					</ul>
				</div>
				-->
			</div>
		</div>
	</div>
</body>
</html>