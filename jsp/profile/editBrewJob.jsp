<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/incl/static.inc"%>
<fmt:bundle basename="MessageBundle">
<html>
<head>
<title><fmt:message key="BrewJob"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link id="skinCss" href="jsp/public/ISCSSobjects_style5.css" type="text/css" rel="stylesheet">   
<script type="text/javascript" src="jsp/js/util.js"></script>
<link type="text/css" rel="stylesheet" href="skins/dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen"/>
<script type="text/javascript" src="skins/dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
<script type="text/javascript" src="jsp/public/skin.js"></script>
</head>

<body>
<form method="post">
<div id="gtop">
	<jsp:include page="../incl/action.jsp">
		<jsp:param name="type" value="save"/>
		<jsp:param name="key" value="Edit"/>
		<jsp:param name="action" value="BrewJob.do"/>
		<jsp:param name="method" value="processEdit"/>
	</jsp:include>
	<jsp:include page="../incl/action.jsp">
		<jsp:param name="type" value="cancel"/>
		<jsp:param name="key" value="Cancel"/>
		<jsp:param name="action" value="BrewJob.do"/>
		<jsp:param name="method" value="listBrewJob"/>
	</jsp:include>
</div>

<div id="container">
<%@ include file="../incl/b_message.jsp" %>
<input type="hidden" name="brewJob.id" value="${brewJob.id }"/>

<div>
<table  class="twrap">
<tr>
<td>

<table class="modify">
<caption><fmt:message key="Update"/> <fmt:message key="BrewJob"/></caption>

<tbody>
<tr>
<td class="tl"><fmt:message key="WineStyle"/></td>
<td>
<select name="brewJob.productId">
	<c:forEach var="items" items="${wineStyles}" varStatus="s">
		<option value="${items.id}"

		<c:if test="${items.id==brewJob.productId}">
			selected="selected"
		</c:if>
			>
		${items.styleName}
		</option>
	--</c:forEach>
</select>
<font class="fm">*</font>
</td>
</tr>

<tr>
<td class="tl"><fmt:message key="BrewNumber"/></td>
<td><input type="text" name="brewJob.brewNumber" value="${brewJob.brewNumber }" maxlength="20" style="width:120px;" /><font class="fm">*</font></td>
</tr>

<tr>
<td class="tl"><fmt:message key="Quantity"/></td>
<td><input type="text" name="brewJob.quantity" value="${brewJob.quantity }" maxlength="7" style="width:120px;"  /><font class="fm">*</font></td>
</tr>

<tr>
<td class="tl"><fmt:message key="Unit"/></td>
<td><input type="text" name="brewJob.unit" value="${brewJob.unit }"  maxlength="4" style="width:120px;" /><font class="fm">*</font></td>
</tr>

<tr>
<td class="tl"><fmt:message key="JobState"/></td>
<td>
<select name="brewJob.jobState">
	<c:forEach var="items" items="${jobStats}" varStatus="s">
		<option value="${items.key}"

		<c:if test="${items.value==brewJob.jobState}">
			selected="selected"
		</c:if>
			>
		<fmt:message key="${items.value}"/> 
		</option>
	--</c:forEach>
</select>
<font class="fm">*</font></td>
</tr>

</table>
</td>
</tr>

</table>
</div>

<jsp:include page="../incl/g_footer.jsp" />
</div>
</form>
</body>
</html>
</fmt:bundle>