<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web_pro.*"%>
<jsp:useBean id="wx" scope="page" class="web_pro.wx"> </jsp:useBean>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/emoji.css" />
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />
<!-- bootstrap -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/bootstrap-paginator.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/index.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/materialize.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.bundle.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />

<script src=" https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
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
    $(function(){
  	  $.ajax({
            //url: 'http://localhost:8090/XCX_server/json_02',
            url: '<%=basePath%>wx_getname',
            type: "GET",
			dataType: "json",
			jsonp:'callback',
            // 传递给后台接口，用以获得jsonp回调函数名的参数名(一般默认为:callback)              
		//	jsonpCallback:"successCallback",
            // 自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，
            // 也可以写"?"，jQuery会自动为你处理数据
          success: function(data){
               console.log('数据', data);
          /*      alert(data.user_info_list); */
               $("#list").html('');
               var json = eval(data.user_info_list); //数组       
               $.each(json, function (index, item) {                
                   var openid = json[index].openid;
                  var nickname = json[index].nickname;
                  var headimgurl = json[index].headimgurl;
                  var sex = json[index].sex;
                  var country = json[index].country;
                  var province = json[index].province;
                  $("#list").html($("#list").html() + "<tr style=' margin:20px;background:   #fff;border-top-left-radius:15px;border-top-right-radius:15px;border-bottom-left-radius:0px;border-bottom-right-radius:0px;'><td style='padding:20px; color: #444444;width:132px;'><div style='width:100px; height:100px; border-radius:50%; overflow:hidden;'> <img  style='size:30%;' src="+headimgurl+" />" +"</div></td><td><input name='nkname' type='text' style=' color: #444444;background-color:transparent;border:0;width:80px' disabled='disabled' value="+ nickname +" /> </td><td style='color:red;'><input name='opid'  style=' color: #444444;background-color:transparent;border:0;' disabled='disabled' type='text' value="+ openid +" /> </td><td><input name='himg' type='text' style='display: none' value="+ headimgurl +" /> "+country+province+"</td><td><input name='sex' type='text'style='background-color:transparent;border:0;width:90px; color: #444444;' disabled='disabled'  value="+ sex +" /></td></tr>");
               });
            },
            
           // http://itcmsg.bnuz.edu.cn:8090/test/pic   图片文件夹
            error: function(){
               alert('faile');
            }
        });
   });
   

   
   function viewPersonal(id){
	   $.ajax({
			url:'<%=basePath%>user/getUser',
			type:'GET',
			data:{id:id},
			dataType:'json',
			success:function(json){
				if(json){
					$('#myviewform').find("input[name='phone']").val(json.phone);
					$('#myviewform').find("input[name='username']").val(json.username);
					$('#myviewform').find("input[name='qq']").val(json.qq);
					$('#myviewform').find("input[name='power']").val(json.power);
					$('#myviewform').find("input[name='createAt']").val(json.createAt);
					$('#viewModal').modal('toggle');
				}
			},
			error:function(){
				alert('请求超时或系统出错!');
				$('#viewModal').modal('hide');
			}
   });
  }
   
   function sendContext(){
	 var context= $("#mycontext").text();
	 $.ajax({
		 url:'<%=basePath%>user/insertSelective',
		 type:'POST',
		 data:{context:context},
		 dataType:'json',
		 success:function(json){
			 alert(json.msg);
			 location.reload();
		 },
		error:function(){
			 alert('请求超时或系统出错!');
			}
	 });
	   
   }
   
   $(function(){
       var options={
           bootstrapMajorVersion:1,    //版本
           currentPage:1,    //当前页数
           numberOfPages:5,    //最多显示Page页
           totalPages:10,    //所有数据可以显示的页数
           onPageClicked:function(e,originalEvent,type,page){
               console.log("e");
               console.log(e);
               console.log("originalEvent");
               console.log(originalEvent);
               console.log("type");
               console.log(type);
               console.log("page");
               console.log(page);
           }
       }
       //$("#page").bootstrapPaginator(options);
   })
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

					<input type="hidden" value="${myPurse.recharge}" id="recharge" /> <input
						type="hidden" value="${myPurse.withdrawals}" id="withdrawals" /> <span
						class="btn" data-toggle="modal" data-target="#myModal"
						style="width: 98%; background-color: rgb(79, 190, 246); color: rgba(255, 255, 255, 1); margin-top: 0.5cm;">
						我的积分：${cur_user.power} </span>

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
<%-- <%=WX_token.getWXtoke2() %> 
<%=WX_token.getWXtoke3() %>  --%>

<!-- <div class="xuanfu"><div style="padding-top:20px">粉丝列表</div></div>
<br/>
     --> 
     
  <form method="post" action="../wx_ok">
    <table id="list1" class="table" style="border: 1px solid darkgray;
    width: 80%;
    margin:0 auto;
    border-radius: 15px;
    margin-top:100px;
    margin-bottom:30px;
    background-color: #6699cc;
    color:white;
    overflow: hidden;
    font-size: 14px;
    box-shadow: 0px 20px 20px -20px #5E5E5E;
    box-shadow: 7px 7px 20px 0 #e8e9eb;" >
  <tr> 
   <td>头像</td>
   <td>昵称</td>
   <td>OPENID</td>
   <td>地址</td>
    <td>性别</td>
   </tr>
    </table>
  <table id="list" class="table" style="border: 1px solid darkgray;
    width: 80%;
    margin:0 auto;
    border-radius: 15px;
   /*  margin-top: 25%; */
    color: #444444;
    overflow: hidden;
    font-size: 14px;
    box-shadow: 7px 7px 20px 0 #e8e9eb;" >
  
    </table>
 <table id="list2" class="table" style="border: 1px solid darkgray;
    width: 60%;
    margin:0 auto;
    border-radius: 15px;
    margin-top:100px;
    margin-bottom:30px;
    background-color: #fddf75;
    color:white;
    overflow: hidden;
    font-size: 14px;
    max-width:800px;
    box-shadow: 0px 20px 20px -20px #5E5E5E;" >
  <tr> 
   <td>asstoken:</td>
   <td><%=wx.getWXtoke()%></td>
  
   </tr>
    </table>
   <!-- <input  name="" type="submit" style="margin:0 auto; background-color: #6699cc; 
    border: none;
    color: white;
    padding: 15px 32px;
    margin-top:30px;
     margin-left:320px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    border-radius：10px;" class="btn" value="确认保存"/>  -->
</form>

			</div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="viewModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title middle" id="myModalLabel">查看用户信息</h4>
				</div>
				<div class="modal-body" style="height: 220px;">
					<form id="myviewform">
						<div class="form-group">
							<label for="recipient-name" class="control-label col-sm-2">名称:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="message-text"
									name="username" readonly />
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label col-sm-2">手机号:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="message-text"
									name="phone" readonly />
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label col-sm-2">qq号:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="message-text"
									name="qq" readonly />
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label col-sm-2">信用积分:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="message-text"
									name="power" readonly />
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label col-sm-2">开户时间:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="message-text"
									name="createAt" readonly />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>

<style type="text/css">
html,body {
/*   background: #fdf9ea 0% 0% / contain no-repeat;
  background-size: contain; */
  }
  
.xuanfu{
/* 	left: 0;
	position: fixed;
	top: 0;
	width: 100%;
	height:70px;
	z-index: 100;
	background-color:#fddf75;
	color:white;
	text-align: center;
	padding-top:
	box-shadow: 0px 20px 20px -20px #5E5E5E; */
	}
  
</style>

</html>

