<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/incl/static.inc"%>
<%@page import="com.mooo.mycoz.framework.util.ColorUtil" %>

<fmt:bundle basename="MessageBundle">
<html>
<head>
<title><fmt:message key="Account"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link id="skinCss" href="jsp/public/ISCSSobjects_style5.css" type="text/css" rel="stylesheet"/>   
<script type="text/javascript" src="jsp/js/util.js"></script>
<link type="text/css" rel="stylesheet" href="skin/dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
<script type="text/javascript" src="skin/dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
<script type="text/javascript" src="jsp/public/skin.js"></script>
</head>

<body>
<form method="post">
<div id="gtop">

</div>

<div id="container">

<table style="border: 0;border-collapse: collapse;">
<caption>原酒投票</caption>
<tr style="height:100px;vertical-align: bottom;">

<td style="height:100%;">
<div style="height:20%;background:<%=ColorUtil.getRandColorCode() %>;">20%</div>
</td>

<td style="height:100%;">
<div style="height:40%;background:<%=ColorUtil.getRandColorCode() %>;">40%</div>
</td>

<td style="height:100%;">
<div style="height:100%;background:<%=ColorUtil.getRandColorCode() %>;">100%</div>
</td>

</tr>

<tr>
<td>口感</td>
<td>香型</td>
<td>酒精度</td>
</tr>

<tr>
<td><input type="checkbox" name="factor"></td>
<td><input type="checkbox" name="factor"></td>
<td><input type="checkbox" name="factor"></td>
</tr>

<tr>
<td colspan="3">
	<jsp:include page="../jsp/incl/actionb.jsp">
		<jsp:param name="key" value="投票"/>
		<jsp:param name="action" value="Index.do"/>
		<jsp:param name="method" value="questionnaire"/>
	</jsp:include>
</td>
</tr>
</table>


<table style="border: 0;border-collapse: collapse;">
<caption>原酒溯源查询</caption>
<tr style="width:100%;height:10px;vertical-align: bottom;">

<td style="width:20%;">
<div style="background:<%=ColorUtil.getRandColorCode() %>;">40%</div>
</td>

<td style="width:20%;">
<div style="background:<%=ColorUtil.getRandColorCode() %>;">40%</div>
</td>

<td style="width:60%;">
<div style="background:<%=ColorUtil.getRandColorCode() %>;">60%</div>
</td>

</tr>

</table>

</div>

</form>
</body>
</html>
</fmt:bundle>