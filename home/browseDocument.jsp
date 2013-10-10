<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/incl/static.inc"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>四川省酿酒研究所</title>
<link href="./skins/default/styles/global.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="door_top">
		<div class="addtoFavorite">
			<div class="door_topleft">
				<a href="#">WAP版</a> <a href="#">设为首页</a> <a href="#">网站地图</a>
			</div>
			<p>
				<a href="#">设为首页</a>| <a href="#">加入收藏</a>
			</p>
		</div>
	</div>

	<div class="door_content">
		<div class="cont_logo">
			<span><a href="index.html"><img src="skins/default/images/cont_logo.png"
					width="300" height="54" /></a></span>
			<ul class="cont_logomenu">
				<li><a href="#">科技交流</a></li>
				<li><a href="#">行业资讯</a></li>
				<li><a href="#">头条新闻</a></li>
				<li><a href="#">政策法规</a></li>
				<li><a href="#">最新公告</a></li>
				<li><a href="#">工作动态</a></li>
			</ul>
			<div class="con_form">
				<form>
					<input class="cont_formsubt" type="text" value="" /> <input
						class="cont_subminimg" type="image" src="skins/default/images/submit.gif" />
				</form>
			</div>
		</div>
	</div>
	<div class="cont_cont">
		<div class="cont_left">
			<h2>${document.docTitle }</h2>
			<div class="cont_leftbt">
				<span><fmt:formatDate value="${document.docDate }" type="date"/></span>
			</div>
			<div class="cont_matter">
				${document.docDetail }
			</div>
		</div>
		<div class="cont_right">
			<div class="recommend">
				<div class="recommendbt">
					<h4>精华推荐</h4>
				</div>
				<div class="recommendcont">
					<dl>
						<dt>
							<a href=""><img src="skins/default/images/cont_left.jpg" /></a>
						</dt>
						<dd>
							<a href="#">张德江强调：营造有利于中小企业发展的良好环境</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<a href=""><img src="skins/default/images/cont_left0.jpg" /></a>
						</dt>
						<dd>
							<a href="#">四川省酿酒研究所专家团队到川北酒乡视察指导</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<a href=""><img src="skins/default/images/cont_left1.jpg" /></a>
						</dt>
						<dd>
							<a href="#">四川省酿酒研究所专家团队在白酒企业考察指导</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<a href=""><img src="skins/default/images/cont_left2.jpg" /></a>
						</dt>
						<dd>
							<a href="#">对白酒塑化剂的一点认识</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<a href=""><img src="skins/default/images/cont_left3.jpg" /></a>
						</dt>
						<dd>
							<a href="#">打造酒界"翰林院" </a>
						</dd>
					</dl>
					<dl>
						<dt>
							<a href=""><img src="skins/default/images/cont_left4.jpg" /></a>
						</dt>
						<dd>
							<a href="#">四川省经信委领导赴四川省酿酒研究所调研及指导工作 </a>
						</dd>
					</dl>
				</div>
			</div>

			<div class="cont_focus">
				<div class="cont_focusbt">
					<span>今日头条</span>
				</div>
				<ul>
					<li><a href="#">张德江强调：营造有利于中小企业发展的良好环境</a></li>
					<li><a href="#">四川省酿酒研究所专家团队到川北酒乡视察指导</a></li>
					<li><a href="#">四川省酿酒研究所专家团队在白酒企业考察指导</a></li>
					<li><a href="#">对白酒塑化剂的一点认识</a></li>
					<li><a href="#">打造酒界"翰林院" </a></li>
					<li><a href="#">张德江强调：营造有利于中小企业发展的良好环境</a></li>
					<li><a href="#">四川省经信委领导赴四川省酿酒研究所调研及指导工作</a></li>
				</ul>
			</div>


			<div class="cont_topic">
				<div class="cont_topicbt">
					<h4>今日话题</h4>
				</div>
				<ul>
					<li><a href="#"><img src="skins/default/images/cont_left.jpg" /></a> <a
						class="link" href="#">张德江强调：营造有利于中小企业发展的良好环境</a></a></li>

					<li><a href="#"><img src="skins/default/images/cont_left1.jpg" /></a> <a
						class="link" href="#">四川省酿酒研究所专家团队到川北酒乡视察指导</a></a></li>

					<li><a href="#"><img src="skins/default/images/cont_left2.jpg" /></a> <a
						class="link" href="#">四川省酿酒研究所专家团队在白酒企业考察指导</a></a></li>

					<li><a href="#"><img src="skins/default/images/cont_left3.jpg" /></a> <a
						class="link" href="#">对白酒塑化剂的一点认识</a></li>
				</ul>
			</div>
		</div>
		<div></div>
	</div>
	<hr style="width: 100%; margin: 20px 0 0px 0;" color="#DDDDDD" size="1"/>
	<div class="copyright">
		<p>版权所有©2009 四川省酿酒研究所 Copyright©2009China Academy of Building
			Research</p>
		<p>地址： 邮编：643000</p>
		<p>电话：0838-5195399 传真：0838-5195399 邮箱：scniang9@sina.com
			蜀ICP备08001331号</p>
		<p>策划设计：越佳网络 站长统计</p>
	</div>


</body>
</html>