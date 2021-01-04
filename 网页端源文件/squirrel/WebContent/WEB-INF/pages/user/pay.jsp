<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>确认订单</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />

<!-- bootstrap -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

 


    <style>
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
z-index:99999;
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
.container{padding-top:10px;border-radius:5px;}
#user_content{
margin-top:50px;
}
#user_nav{
margin-top:65px;
}
.story{
padding:30px;
}
    </style>
<!--订单编号随机数（有可能重复，得处理）  -->
<script type="text/javascript">
	window.onload = function() {
		var o = document.getElementsByClassName('order-num');

		o[0].value = fRandomBy(00000000, 99999999);
	}
	function fRandomBy(under, over) {
		switch (arguments.length) {
		case 1:
			return parseInt(Math.random() * under + 1);
		case 2:
			return parseInt(Math.random() * (over - under + 1) + under);
		default:
			return 0;
		}
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
			<a href="<%=basePath%>goods/homeGoods" id="top" > <img  src="<%=basePath%>img/易物1.png" style="width:100px; hight:100px;"><em class="em2" style="color:#444444;position:absolute;top:10px;font-size: 28px;font-family:'Microsoft YaHei','微软雅黑';
    font-weight: bolder;">校园闲置物品租借平台</em> <em class="em3"></em>
				</a>

			</div>
			
			</div>
		</nav>
	</div>
			<!--

            描述：左侧个人中心栏
        -->
			<div id="user_nav">
				<div class="user_info">
					<div class="head_img">
						<img src="<%=basePath%>img/photo.jpg">
					</div>
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
					<ul>
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
					<h1 style="text-align: center">确认订单</h1>
					<hr />
					<div class="share_content">
						<div class="story">
							<form class="form-horizontal" role="form"
								action="<%=basePath%>orders/addOrders">
								<h4>
									&nbsp;&nbsp;&nbsp;&nbsp;订单编号： <input
										name="orderNum" class="order-num" type="text"
										style="border: 0px; background: rgba(0, 0, 0, 0);" value="" />
									<input name="goodsId" type="hidden"
										value="${goodsExtend.goods.id}" />
								</h4>
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">图片:</label>
									<div class="col-sm-10">
										<img style="height: 150px; weight: 150px;"
											src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}" />
									</div>
									<label for="firstname" class="col-sm-2 control-label">名称：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" disabled="disabled"
											style="border: 0px; background: rgba(0, 0, 0, 0);"
											value="${goodsExtend.goods.name}">
									</div>

									<label for="firstname" class="col-sm-2 control-label">备注：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="请输入备注（租赁人信息 地址 联系方式等）" value=""
											name="orderInformation">
									</div>
								</div>
								<hr />
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
										<a href="<%=basePath%>goods/goodsId/${goodsExtend.goods.id}"
											class="btn btn-danger">取消租赁</a>
										<button type="submit" class="btn btn-info">租赁</button>


									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!--

                描述：最右侧，可能认识的人
            
				-->
			</div>
		</div>
	</div>

</body>
</html>