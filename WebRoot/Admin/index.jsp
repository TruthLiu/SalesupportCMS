<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html lang="ch">

<head>
	<meta charset="utf-8"/>
	<title>维修设备</title>
	
	<link rel="stylesheet" href="css/layout.css" type="text/css" media="screen" />
	<!--[if lt IE 9]>
	<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script src="js/jquery-1.5.2.min.js" type="text/javascript"></script>
	<script src="js/hideshow.js" type="text/javascript"></script>
	<script src="js/jquery.tablesorter.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.equalHeight.js"></script>
	<script type="text/javascript">
	$(document).ready(function() 
    	{ 
      	  $(".tablesorter").tablesorter(); 
   	 } 
	);
	$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
    </script>
    <script type="text/javascript">
    $(function(){
        $('.column').equalHeight();
    });
	</script>
	<script type="text/javascript">
		function del(id) {
			if(confirm("确定要删除吗？")) {
				location.href = "admin!deleterepair.action?arepair.Repair_ID=" + id;
			}
		}
	</script>

</head>


<body>

	<header id="header">
		<hgroup>
			<h1 class="site_title"><a href="dashboard.jsp">设备维修后台管理</a></h1>
			<h2 class="section_title"></h2><div class="btn_view_site"><a href="login.jsp">退出</a></div>
		</hgroup>
	</header> <!-- end of header bar -->
	
	<section id="secondary_bar">
		<div class="user">
			<p><s:property value="#session.USER_NAME"/> </p>
			<!-- <a class="logout_user" href="#" title="Logout">Logout</a> -->
		</div>
		<div class="breadcrumbs_container">
			<article class="breadcrumbs"><a href="dashboard.jsp">系统管理</a> <div class="breadcrumb_divider"></div> <a class="current">维修订单</a></article>
		</div>
	</section><!-- end of secondary bar -->
	
	<aside id="sidebar" class="column">
		<form class="quick_search">
			<input type="text" value="Quick Search" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
		</form>
		<hr/>
		<h3>系统管理</h3>
		<ul class="toggle">
			<li class="icn_categories"><a href="admin!queryOrder.action">维修订单</a></li>
			<li class="icn_settings"><a href="system!querySystemPlan.action">系统调度</a></li>
			
			<li class="icn_tags"><a href="monitor!querys.action">过程监控</a></li>
		</ul>		
		
		<h3>维修人员管理</h3>
		<ul class="toggle">
			<li class="icn_view_users"><a href="personnel!queryAllPerson.action">查看维修人员</a></li>
			<li class="icn_add_user"><a href="addPerson.jsp">添加维修人员</a></li>
			<li class="icn_profile"><a href="#">维修人员历史贡献</a></li>
		</ul>

		<footer>
			<hr />
			<p><strong>Copyright &copy; 2016 后台管理 Admin</strong></p>
			<p>Theme by TechDream</p>
		</footer>
	</aside><!-- end of sidebar -->
	
	<section id="main" class="column">
		
		<h4 class="alert_info">优先审核提示信息！</h4>
		
		
		<article class="module width_full">
		<header><h3 class="tabs_involved">维修列表</h3>
		<ul class="tabs">
   			<li><a href="#tab1">审核通过</a></li>
    		<li><a href="#tab2">未审核</a></li>
		</ul>
		</header>

		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th></th> 
    				<th>设备SN</th> 
    				<th>维修人</th>
    				<th>维修开始时间</th> 
    				<th>维修结束时间</th> 
    				<th>维修状态</th>
    				<th>操作</th> 
				</tr> 
			</thead> 
			<tbody> 
			 <s:iterator value="listY">
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td><s:property value="OrderName" /></td> 
    				<td><s:property value="PName" /></td>
    				<td><s:property value="startTime" /></td> 
    				<td><s:property value="endTime" /></td> 
    				<td><s:property value="state" /></td>
    				<td><a href="javascript:del('<s:property value="repairID"/>')"><input type="image" src="images/icn_alert_error.png" title="删除"></a></td> 
				</tr> 
				</s:iterator>
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->
			
			<div id="tab2" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th></th> 
    				<th>设备SN</th> 
    				<th>维修描述</th> 
    				<th>申请时间</th>
    				<th>申请人</th> 
    				<th>电话</th>
    				<th>操作</th> 
				</tr> 
			</thead> 
			<tbody> 
			  <s:iterator value="listN">
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td><s:property value="orderName" /></td> 
    				<td><s:property value="orderDes" /></td> 
    				<td><s:property value="orderTime" /></td> 
    				<td><s:property value="pname" /></td> 
    				<td><s:property value="phone" /></td>
    				<td><a href="admin!updaterepair.action?arepair.Repair_ID=<s:property value='repairID'/>"><input type="image" src="images/icn_alert_success.png" title="通过" ></a> 
    				<a href="javascript:del('<s:property value="repairID"/>')"><input type="image" src="images/icn_alert_error.png" title="删除"></a></td> 
				</tr> 		
			  </s:iterator>
			</tbody> 
			</table>

			</div><!-- end of #tab2 -->
			
		</div><!-- end of .tab_container -->
		
		</article><!-- end of content manager article -->
		
		
		
		<div class="clear"></div>
		
		
		<h4 class="alert_warning">A Warning Alert</h4>
			
		<div class="spacer"></div>
	</section>


</body>

</html>