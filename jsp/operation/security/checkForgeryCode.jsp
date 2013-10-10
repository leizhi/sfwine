<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/incl/static.inc"%>
<fmt:bundle basename="MessageBundle">
<html>
<head>
<title><fmt:message key="ForgeryCode"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link id="skinCss" href="jsp/public/ISCSSobjects_style5.css" type="text/css" rel="stylesheet">   
<script type="text/javascript" src="jsp/js/util.js"></script>
<link type="text/css" rel="stylesheet" href="skins/dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen"/>
<script type="text/javascript" src="skins/dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
<script type="text/javascript" src="jsp/public/skin.js"></script>

<style type="text/css">
body,td{font-family:Arial,Helvetica,sans-serif,"黑体";font-size:14px;color:#000;margin:0;padding:0;}
div,h1,h2,h3,h4,p,form,label,textarea,span,body,div,dl,dt,dd,ul,ol,li,pre,fieldset,input,textarea,blockquote,emBED{margin:0;padding:0;line-height: 28px;}
img{border:none;}

ul,li{list-style-type:none;}
body{background-image:url(skins/default/images/top_bg.gif); background-repeat:repeat-x;}
.top_bg{background-image:url(skins/default/images/top.jpg); background-repeat:no-repeat; height:184px;}
.title_bg{background-image:url(skins/default/images/tit_bg.gif); background-repeat:no-repeat; height:39px; font-size:20px; font-family:Arial,Helvetica,sans-serif,"黑体"; font-weight:bold; padding-left:10px; color:#FFFFFF; text-align:left;}

a:link{color:#0069d4;text-decoration:none;}
a:visited{color:#0069d4;text-decoration:none;}
a:hover{color:#f24f00;text-decoration:underline;}
a:active{color:#0069d4;}
a:focus{outline:none;-moz-outline:none;}

.copyright_bg{background-image:url(skins/default/images/copyright_bg.gif); background-repeat:repeat-x; padding:0 30px 0 10px; height:104px; text-align:center; }
</style>
</head>

<body>
<center>
  <table width="890" cellspacing="0" cellpadding="0">
    <tr>
      <td class="top_bg">&nbsp;</td>
    </tr>
  </table>
  <table width="850" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="skins/default/images/k_left_top.gif" alt="kuang" width="12" height="10" /></td>
      <td height="10" background="skins/default/images/k_top.gif"><img src="skins/default/images/k_top.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_top.gif" alt="k" width="12" height="10" /></td>
    </tr>
    <tr>
      <td width="12" background="skins/default/images/k_left_m.gif">&nbsp;</td>
      <td align="left"><table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td class="title_bg">企业基本信息</td>
        </tr>
      </table>
 ${winery.introduction }<br />
        　　联系方式：${winery.telephone }<br />
	</td>
      <td width="12" background="skins/default/images/k_right_r.gif">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="skins/default/images/k_left_b.gif" alt="k" width="12" height="10" /></td>
      <td height="10"><img src="skins/default/images/k_bottom.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_b.gif" alt="k" width="12" height="10" /></td>
    </tr>
  </table>
  <table width="850" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="skins/default/images/k_left_top.gif" alt="kuang" width="12" height="10" /></td>
      <td height="10" background="skins/default/images/k_top.gif"><img src="skins/default/images/k_top.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_top.gif" alt="k" width="12" height="10" /></td>
    </tr>
    <tr>
      <td width="12" background="skins/default/images/k_left_m.gif">&nbsp;</td>
      <td align="left"><table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title_bg">原酒酿造</td>
          </tr>
        </table>
        　　窖池窖龄：15年（建造于1995年）<br />
        　　生产原料：高粱、小麦、大米、玉米、糯米<br />
        　　投粮时间：2010年1月1日<br />
        　　发酵时长：90天<br />
        　　蒸馏时间：2010年4月1日<br />
        　　生产班组：生产2组（员工甲、乙、丙、丁）、<br />
        　　（可添加原料产地、质检报告、酿酒工艺、制曲等信息）</td>
      <td width="12" background="skins/default/images/k_right_r.gif">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="skins/default/images/k_left_b.gif" alt="k" width="12" height="10" /></td>
      <td height="10"><img src="skins/default/images/k_bottom.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_b.gif" alt="k" width="12" height="10" /></td>
    </tr>
  </table>
  <table width="850" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="skins/default/images/k_left_top.gif" alt="kuang" width="12" height="10" /></td>
      <td height="10" background="skins/default/images/k_top.gif"><img src="skins/default/images/k_top.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_top.gif" alt="k" width="12" height="10" /></td>
    </tr>
    <tr>
      <td width="12" background="skins/default/images/k_left_m.gif">&nbsp;</td>
      <td align="left"><table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title_bg">原酒存储</td>
          </tr>
        </table>
        　　入库时间：2010年4月1日<br />
        　　等级评定：优级<br />
        　　品 酒 师：国家级白酒评委杨官荣等（证书编号）<br />
        　　存储器具：陶坛<br />
        　　存储时长：2年<br />
        　　出库时间：2012年4月2日</td>
      <td width="12" background="skins/default/images/k_right_r.gif">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="skins/default/images/k_left_b.gif" alt="k" width="12" height="10" /></td>
      <td height="10"><img src="skins/default/images/k_bottom.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_b.gif" alt="k" width="12" height="10" /></td>
    </tr>
  </table>
  <table width="850" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="skins/default/images/k_left_top.gif" alt="kuang" width="12" height="10" /></td>
      <td height="10" background="skins/default/images/k_top.gif"><img src="skins/default/images/k_top.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_top.gif" alt="k" width="12" height="10" /></td>
    </tr>
    <tr>
      <td width="12" background="skins/default/images/k_left_m.gif">&nbsp;</td>
      <td align="left"><table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title_bg">存储第三方监管</td>
          </tr>
        </table>
        　　监管机构：中铁现代物流科技股份有限公司成都分公司<br />
        　　监管起止日期：2010年4月1日至2012年4月2日</td>
      <td width="12" background="skins/default/images/k_right_r.gif">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="skins/default/images/k_left_b.gif" alt="k" width="12" height="10" /></td>
      <td height="10"><img src="skins/default/images/k_bottom.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_b.gif" alt="k" width="12" height="10" /></td>
    </tr>
  </table>
  <table width="850" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="skins/default/images/k_left_top.gif" alt="kuang" width="12" height="10" /></td>
      <td height="10" background="skins/default/images/k_top.gif"><img src="skins/default/images/k_top.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_top.gif" alt="k" width="12" height="10" /></td>
    </tr>
    <tr>
      <td width="12" background="skins/default/images/k_left_m.gif">&nbsp;</td>
      <td align="left"><table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title_bg">白酒（成品酒）组合</td>
          </tr>
        </table>
        　　组合时间：2012年4月2日<br />
        　　调味酒年份：15年（酿造于1995年），添加量≥10%<br />
        　　品、调酒师：国家白酒评委杨官荣等（证书编号）<br />
        　　存储时长：6个月</td>
      <td width="12" background="skins/default/images/k_right_r.gif">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="skins/default/images/k_left_b.gif" alt="k" width="12" height="10" /></td>
      <td height="10"><img src="skins/default/images/k_bottom.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_b.gif" alt="k" width="12" height="10" /></td>
    </tr>
  </table>
  <table width="850" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="skins/default/images/k_left_top.gif" alt="kuang" width="12" height="10" /></td>
      <td height="10" background="skins/default/images/k_top.gif"><img src="skins/default/images/k_top.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_top.gif" alt="k" width="12" height="10" /></td>
    </tr>
    <tr>
      <td width="12" background="skins/default/images/k_left_m.gif">&nbsp;</td>
      <td align="left"><table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title_bg">成品酒灌装</td>
          </tr>
        </table>
        　　过滤材料：活性炭、硅藻土、树脂、阴阳离子<br />
        　　灌装时间：2012年10月5日—10月8日</td>
      <td width="12" background="skins/default/images/k_right_r.gif">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="skins/default/images/k_left_b.gif" alt="k" width="12" height="10" /></td>
      <td height="10"><img src="skins/default/images/k_bottom.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_b.gif" alt="k" width="12" height="10" /></td>
    </tr>
  </table>
  <table width="850" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="skins/default/images/k_left_top.gif" alt="kuang" width="12" height="10" /></td>
      <td height="10" background="skins/default/images/k_top.gif"><img src="skins/default/images/k_top.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_top.gif" alt="k" width="12" height="10" /></td>
    </tr>
    <tr>
      <td width="12" background="skins/default/images/k_left_m.gif">&nbsp;</td>
      <td align="left"><table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="title_bg">质量检验</td>
          </tr>
        </table>
        　　检 验 员：高级食品检验工焦红梅（证书编号）<br />
        　　检验时间：2012年10月4日（灌装前）、2012年10月9日（灌装后抽样）<br />
        　　主要检验器具：0—100（3支组）酒精计、GC—2091气相色谱仪、M304269电子分析天平、PHS—3C酸度计、D100塑化剂检测仪<br />
        　　检验报告：合格产品，编号JYSS2012100401、JYS2012100901<br />
        　　<a href="http://www.y9jy.com/manage/index">更多信息请点击 &gt;&gt;</a></td>
      <td width="12" background="skins/default/images/k_right_r.gif">&nbsp;</td>
    </tr>
    <tr>
      <td><img src="skins/default/images/k_left_b.gif" alt="k" width="12" height="10" /></td>
      <td height="10"><img src="skins/default/images/k_bottom.gif" alt="k" width="836" height="10" /></td>
      <td><img src="skins/default/images/k_right_b.gif" alt="k" width="12" height="10" /></td>
    </tr>
  </table>
  <table width="100%" cellspacing="0" cellpadding="0">
    <tr>
      <td height="10"> </td>
    </tr>
    <tr>
      <td class="copyright_bg"> 版权所有(C )四川省酿酒研究所 ICP证号：蜀ICP备09022149号-10<br />
      [增值电信业务经营许可证A2.B1.B2-20090001] [文网文[2003]0001号] </td>
    </tr>
  </table>
</center>
</body>
</html>
</fmt:bundle>