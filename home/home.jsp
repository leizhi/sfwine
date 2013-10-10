<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/incl/static.inc"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>原酒产业联盟</title>
<link href="./skins/default/styles/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jsp/js/jquery-1.9.0.js"></script>
</head>

<body>
<div class="door_top">
	<div class="addtoFavorite">
    	<p>
        	<a href="<c:url value="/Login.do"/>">监管登录</a>|
        </p>
    </div>
</div>

<div class="door_content">
	<div class="logo">
    	<img src="skins/default/images/logo.png" height="100" width="990" />
    </div>
	
    <div class="door_menu">
    	<div class="door_menuul">
            <div class="door_menulist">
                <a href="<c:url value="/Shop.do"/>">产品介绍</a>
                <a href="<c:url value="/Shop.do"/>">融资服务</a>
            </div>
            
            <div class="door_menulist">
                <a href="<c:url value="/Shop.do"/>">酒厂信息</a>
                <a href="<c:url value="/Shop.do"/>">工作动态</a>
            </div>
            
            <div class="door_menulist">
                <a href="<c:url value="/Shop.do"/>">溯原查询</a>
                <a href="<c:url value="/Shop.do"/>">防伪查询</a>
            </div>
            
            <div class="door_menulist">
                <a href="<c:url value="/Shop.do"/>">川酒安全 </a>
                <a href="<c:url value="/Shop.do"/>">品牌专区</a>
            </div>
            
            <div class="door_menulist">
                <a href="<c:url value="/Shop.do"/>">原酒采购</a>
                <a href="<c:url value="/Shop.do"/>">在线商城</a>
            </div>
            
             <div class="door_menulist">
                <a href="<c:url value="/Shop.do"/>">专家服务</a>
                <a href="<c:url value="/Shop.do"/>">人才培训</a>
            </div>
            
            <div class="door_menulist">
                <a href="<c:url value="/Shop.do"/>">科技交流</a>
                <a href="<c:url value="/Shop.do"/>">白酒文化</a>
            </div>
              
            <div class="door_menulist">
                <a href="<c:url value="/Shop.do"/>">联系我们</a>
            </div>
        </div>
    </div>
    
<div class="door_among">   
  <div class="door_matterlf"> 
    <div class="door_nav">
        <div id="door_intro">
            <ul class="door_introul">
                <li class="door_introIn">今日头条</li>
                <li>品牌专区</li> 
            </ul>
            <div class="contentIn contentInft">
            	 <div class="door_navfont">
                    <p class="door_navbold"><b></b></p>
                    <p class="door_navp"></p>
                    <p class="door_navp"></p>
                    <p class="door_navp"></p>
                  </div>
                  <a class="door_navpa" href="<c:url value="/Shop.do"/>">..详情</a>
            </div>
            <div class="contentInft">
            	<div class="Products">
                	<div class="Products_list">
                    	<div class="door_brandimg">
                        	<a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/brand_0.jpg" /></a>
                        </div>
                        <div class="door_brandtext">
                        	<a href="<c:url value="/Shop.do"/>">华夏酒业 </a>
                        </div>
                    </div>
                    
                    <div class="Products_list">
                    	<div class="door_brandimg">
                        	<a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/brand_1.jpg" /></a>
                        </div>
                        <div class="door_brandtext">
                        	<a href="<c:url value="/Shop.do"/>">宜宾竹海酒业  </a>
                        </div>
                    </div>
                    
                    <div class="Products_list">
                    	<div class="door_brandimg">
                        	<a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/brand_2.jpg" /></a>
                        </div>
                        <div class="door_brandtext">
                        	<a href="<c:url value="/Shop.do"/>">绵春贡酒业 </a>
                        </div>
                    </div>
                    
                    <div class="Products_list">
                    	<div class="door_brandimg">
                        	<a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/brand_3.jpg" /></a>
                        </div>
                        <div class="door_brandtext">
                        	<a href="<c:url value="/Shop.do"/>">吉鑫酒业</a>
                        </div>
                    </div>
                    
                    <div class="Products_list">
                    	<div class="door_brandimg">
                        	<a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/brand_4.jpg" /></a>
                        </div>
                        <div class="door_brandtext">
                        	<a href="<c:url value="/Shop.do"/>">正兴酒业 </a>
                        </div>
                    </div>
                    
                    <div class="Products_list">
                    	<div class="door_brandimg">
                        	<a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/brand_5.jpg" /></a>
                        </div>
                        <div class="door_brandtext">
                        	<a href="<c:url value="/Shop.do"/>">君子酒业 </a>
                        </div>
                    </div>
                    
                </div>
                <a class="door_navpa" href="<c:url value="/Shop.do"/>">..详情</a>
            </div> 

<script>
var timoutid;
$(document).ready(function(){	
	$("#door_intro ul li").each(function(index){
		$(this).mouseover(function(){	
				var inNode=$(this);	
				timoutid = setTimeout(function(){ 				
				$("div.contentIn").removeClass("contentIn");
				$("#door_intro ul li.door_introIn").removeClass("door_introIn");
				$("div.contentInft:eq(" + index + ")").addClass("contentIn");
				inNode.addClass("door_introIn");			
			},100);			
		}).mouseout(function(){
			clearTimeout(timoutid);
		});		
	});
});

</script>
        </div>
    	
        <div class="exchange">
        	<div class="exchange_titil"><span>最新公告</span><a title="点击查看更多" class="exchange_more" href="<c:url value="/Shop.do"/>"><img src="skins/default/images/more0.gif" /></a></div>
        	<ul>
				<c:forEach var="item" items="${results}" varStatus="status">
					<c:url value="/Index.do" var="browseURL">
						<c:param name="method">browseDocument</c:param>
						<c:param name="id">${item.id }</c:param>
					</c:url>
				   <li><a href="${browseURL }">${item.docTitle }"</a></li>
				</c:forEach>
            </ul>
        </div>
    </div>
    
    <div class="door_work">
    	 <div class="word_left">
         	  <div class="word_leftbt">
              <strong>快速服务通道</strong><span><a href="<c:url value="/Shop.do"/>" onmouseover="mouseOver0()" onmouseout="mouseOut0()"><img title="点击查看更多" id="b1" src="skins/default/images/more0.gif"/></a></span>
				<script type="text/javascript">
                function mouseOver0()
                {
                document.getElementById('b1').src ="skins/default/images/more.gif"
                }
                function mouseOut0()
                {
                document.getElementById('b1').src ="skins/default/images/more0.gif"
                }
                </script>
              </div>
              <div class="word_trends">
              		<ul>
                            <li class="trends_dt"><a href="<c:url value="/Shop.do"/>">四川化工职业技术学院品酒师培训班顺利召开</a></li>
                            <li class="trends_time">2012-12-27</li>
                    </ul>
              </div>
         </div>
         
         <div class="word_rule">
         	   <div class="word_leftbt1">
              	<strong>工作动态</strong><span><a href="<c:url value="/Shop.do"/>" onmouseover="mouseOver1()" onmouseout="mouseOut1()"><img title="点击查看更多" id="b2" src="skins/default/images/more0.gif"/></a></span>
				<script type="text/javascript">
                function mouseOver1()
                {
                document.getElementById('b2').src ="skins/default/images/more.gif"
                }
                function mouseOut1()
                {
                document.getElementById('b2').src ="skins/default/images/more0.gif"
                }
                </script>
              </div>
              <div class="rule_Laws">
              		<ul>
                        <li class="rule_Lawsbt"><a href="<c:url value="/Shop.do"/>">白酒标准法规清单</a></li>
                        <li class="Lawstime">2012-12-27</li>
                    </ul>
              </div>
         </div>
    </div>
    
    
        <div class="door_work">
    	 <div class="word_left">
         	  <div class="word_leftbt">
              <strong>行业专家</strong><span><a href="<c:url value="/Shop.do"/>" onmouseover="mouseOver0()" onmouseout="mouseOut0()"><img title="点击查看更多" id="b1" src="skins/default/images/more0.gif"/></a></span>
				<script type="text/javascript">
                function mouseOver0()
                {
                document.getElementById('b1').src ="skins/default/images/more.gif"
                }
                function mouseOut0()
                {
                document.getElementById('b1').src ="skins/default/images/more0.gif"
                }
                </script>
              </div>
              <div class="word_trends">
              		<ul>
                            <li class="trends_dt"><a href="<c:url value="/Shop.do"/>">四川化工职业技术学院品酒师培训班顺利召开</a></li>
                            <li class="trends_time">2012-12-27</li>
                    </ul>
              </div>
         </div>
         
         <div class="word_rule">
         	   <div class="word_leftbt1">
              	<strong>行业咨询</strong><span><a href="<c:url value="/Shop.do"/>" onmouseover="mouseOver1()" onmouseout="mouseOut1()"><img title="点击查看更多" id="b2" src="skins/default/images/more0.gif"/></a></span>
				<script type="text/javascript">
                function mouseOver1()
                {
                document.getElementById('b2').src ="skins/default/images/more.gif"
                }
                function mouseOut1()
                {
                document.getElementById('b2').src ="skins/default/images/more0.gif"
                }
                </script>
              </div>
              <div class="rule_Laws">
              		<ul>
                        <li class="rule_Lawsbt"><a href="<c:url value="/Shop.do"/>">白酒标准法规清单</a></li>
                        <li class="Lawstime">2012-12-27</li>
                    </ul>
              </div>
         </div>
    </div>
    
    <div class="door_poster">
    <a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/dzyj_04.gif" /></a>
    </div>
    
    <div class="door_partner">
    	<div class="door_partnerbt">
        	<strong>合作单位</strong><span><a href="<c:url value="/Shop.do"/>" onmouseover="mouseOver4()" onmouseout="mouseOut4()"><img title="点击查看更多" id="b4" src="skins/default/images/more0.gif"/></a></span>
				<script type="text/javascript">
                function mouseOver4()
                {
                document.getElementById('b4').src ="skins/default/images/more.gif"
                }
                function mouseOut4()
                {
                document.getElementById('b4').src ="skins/default/images/more0.gif"
                }
                </script>
    	</div>
        
        <div class="door_partnercont">
             	<ul class="door_partnerimg">
                	<li><a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/partner0.png" width="120" height="56" /></a></li>
                    <li><a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/partner1.png" width="120" height="56" /></a></li>
                    <li><a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/partner2.png" width="120" height="56" /></a></li>
                    <li><a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/partner3.png" width="120" height="56" /></a></li>
                    <li><a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/partner4.png" width="120" height="56" /></a></li>
                </ul>
             	<ul class="door_partnerfont">
                	<li><a href="<c:url value="/Shop.do"/>">高州酒业高州酒业高州酒业高州酒业</a></li>
                    <li><a href="<c:url value="/Shop.do"/>">峨眉春酒业</a></li>
                    <li><a href="<c:url value="/Shop.do"/>">君子酒业</a></li>
                    <li><a href="<c:url value="/Shop.do"/>">正兴酒业</a></li>
                    <li><a href="<c:url value="/Shop.do"/>">华夏酒业</a></li>
                </ul> 
        </div>
    </div>
    
        <div class="door_Brewing">
    	<div class="door_Bretitle">
        <strong>品牌专区</strong><span><a href="<c:url value="/Shop.do"/>" onmouseover="mouseOver()" onmouseout="mouseOut()"><img title="点击查看更多" id="b3" src="skins/default/images/more0.gif"/></a></span>
				<script type="text/javascript">
                function mouseOver()
                {
                document.getElementById('b3').src ="skins/default/images/more.gif"
                }
                function mouseOut()
                {
                document.getElementById('b3').src ="skins/default/images/more0.gif"
                }
                </script>
        </div>
        <div class="door_Brecont">
             <ul>
                 <li class="door_Brelist"><a href="<c:url value="/Shop.do"/>">白酒喝酒文化 奇帖共赏</a></li><li class="door_Bretime">[2013-3-5 ]</li>
                 <li class="door_Brelist"><a href="<c:url value="/Shop.do"/>">洋酒也陷塑化剂风波</a></li><li class="door_Bretime">[2013-3-4 ]</li>
                 <li class="door_Brelist"><a href="<c:url value="/Shop.do"/>"> 四川省酿酒研究所2013年人才培训发展计划</a></li><li class="door_Bretime">[2013-3-4 ]</li>
                 <li class="door_Brelist"><a href="<c:url value="/Shop.do"/>">四川省酿酒研究所2013年人才培训发展计划</a></li><li class="door_Bretime">[2013-3-4 ]</li>
                 <li class="door_Brelist"><a href="<c:url value="/Shop.do"/>">白酒人才培训的摇篮</a></li><li class="door_Bretime">[2013-2-27 ]</li>
                 <li class="door_Brelist"><a href="<c:url value="/Shop.do"/>">张德江强调：营造有利于中小企业发展的良好环境</a></li><li class="door_Bretime">[2013-2-26 ] </li>
                 <li class="door_Brelist"><a href="<c:url value="/Shop.do"/>">关于举办首届四川省原酒质量鉴评周活动的通知</a></li><li class="door_Bretime">[2013-2-25 ]</li> 
             </ul>
        </div>
    </div>
  </div>  
    
    <div class="door_amongright">
    	<div class="door_Tech">
        	<div class="Tech_titil"><span>监管下载区</span> <a title="点击查看更多"  class="Tech_more" href="<c:url value="/Shop.do"/>"><img src="skins/default/images/more0.gif" /></a></div>
        	<ul>
            	<li><a href="<c:url value="/downloads/SetupRC_v1.2.rar"/>">发卡程序</a></li>
            </ul>
        </div>

    	<div class="door_Tech">
        	<div class="Tech_titil"><span>市场调查</span> <a title="点击查看更多"  class="Tech_more" href="<c:url value="/Shop.do"/>"><img src="skins/default/images/more0.gif" /></a></div>
        	<ul>
        			<c:url value="/Index.do" var="questURL">
						<c:param name="method">questionnaire</c:param>
					</c:url>
            	<li><a href="${questURL }" target="_blank">酒的品质</a></li>
            </ul>
        </div>
        
        <div class="door_wine">
        	<div class="Tech_titil"><span>白酒文化</span> <a title="点击查看更多"  class="Tech_more" href="<c:url value="/Shop.do"/>"><img src="skins/default/images/more0.gif" /></a></div>
            <ul>
            	<li><a href="<c:url value="/Shop.do"/>">白酒喝酒文化 奇帖共赏 </a></li>
                <li><a href="<c:url value="/Shop.do"/>">彝族酒文化（三）</a></li> 
                <li><a href="<c:url value="/Shop.do"/>">彝族酒文化（二）</a></li> 
                <li><a href="<c:url value="/Shop.do"/>">彝族酒文化（一）</a></li> 
                <li><a href="<c:url value="/Shop.do"/>">赋酒名篇赏析</a></li> 
                <li><a href="<c:url value="/Shop.do"/>">哈尼族"闷锅酒" </a></li> 
                <li><a href="<c:url value="/Shop.do"/>">重庆"扯酒皮"</a></li> 
            </ul>
            
        </div>
        <div class="door_advert"><a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/poster_2.gif" /></a></div>
        <div class="door_advert"><a href="<c:url value="/Shop.do"/>"><img src="skins/default/images/poster_3.gif" /></a></div>
        <div class="door_download">
        	<div class="Tech_titil"><span>相关下载</span> <a title="点击查看更多"  class="Tech_more" href="<c:url value="/Shop.do"/>"><img src="skins/default/images/more0.gif" /></a></div>
            <ul>
            	<li><a href="<c:url value="/Shop.do"/>">培训简报 </a></li> 
                <li><a href="<c:url value="/Shop.do"/>">2012宜宾酿酒师</a></li> 
                <li><a href="<c:url value="/Shop.do"/>">2012宜宾品酒师</a></li>
            </ul>
        </div>
        
        <div class="door_contact">
        	<div class="Tech_titil"><span>联系我们</span> <a title="点击查看更多"  class="Tech_more" href="<c:url value="/Shop.do"/>"><img src="skins/default/images/more0.gif" /></a></div>
        	 <ul>
             	<li>电  话:0838-5195399 </li>
				<li>传  真:0838-5195399 </li>
                <li>Q    Q：345841932 </li>
                <li>E- mail：scniangjiu@sina.com </li>
                <li> 地  址：四川省广汉市深圳路2号</li> 
             </ul>
        </div>
        
    </div>
    
</div>

<div class="door_links">
<a href="<c:url value="/Shop.do"/>">中国原酒交易中心</a>
<a href="<c:url value="/Shop.do"/>">中国食品网</a>
<a href="<c:url value="/Shop.do"/>">中国食品信息网</a>
<a href="<c:url value="/Shop.do"/>">成都齐进科技有限公司</a>
<a href="<c:url value="/Shop.do"/>">四川食品公共服务平台</a>
</div>

<div class="copyright">
<p>版权所有©2009 四川原酒 Copyright©2009China Academy of Building Research</p> 
<p>地址： 邮编：643000</p>
<p></p>
<p></p>
</div>
</div>

</body>
</html>