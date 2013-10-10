<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/incl/static.inc"%>
<fmt:bundle basename="MessageBundle">
<html>
<head>
<title><fmt:message key="Card"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link id="skinCss" href="jsp/public/ISCSSobjects_style5.css" type="text/css" rel="stylesheet">   
<script type="text/javascript" src="jsp/js/util.js"></script>
<script type="text/javascript" src="jsp/js/calendar.js"></script>
<script type="text/javascript" src="jsp/public/skin.js"></script>
</head>

<body>
<form method="post">
<div id="gtop">
	<jsp:include page="../../incl/action.jsp">
		<jsp:param name="type" value="save"/>
		<jsp:param name="key" value="Edit"/>
		<jsp:param name="action" value="Card.do"/>
		<jsp:param name="method" value="processEdit"/>
	</jsp:include>
	<jsp:include page="../../incl/action.jsp">
		<jsp:param name="type" value="cancel"/>
		<jsp:param name="key" value="Cancel"/>
		<jsp:param name="action" value="Card.do"/>
		<jsp:param name="method" value="listCard"/>
	</jsp:include>
</div>

<div id="container">
<%@ include file="../../incl/b_message.jsp" %>
<input type="hidden" name="card.id" value="${card.id }"/>

<div>
<table  class="twrap">
<tr>
<td>

<table class="modify">
<caption><fmt:message key="Update"/> <fmt:message key="Card"/></caption>

<tbody>

<tr>
<td class="tl"><fmt:message key="Winery"/></td>
<td>
<select name="card.wineryId">
	<c:forEach var="items" items="${winerys}" varStatus="s">
		<option value="${items.winery.id}"

		<c:if test="${items.winery.id==card.wineryId}">
			selected="selected"
		</c:if>
			>
		${items.winery.enterpriseName}
		</option>
	--</c:forEach>
</select>
</td>
</tr>

<tr>
<td class="tl"><fmt:message key="Rfidcode"/></td>
<td><input type="text" name="card.rfidcode" value="${card.rfidcode }"/></td>
</tr>

<tr>
<td class="tl"><fmt:message key="Uuid"/></td>
<td><input type="text" name="card.uuid" value="${card.uuid }"/></td>
</tr>

<tr>
<td class="tl"><fmt:message key="Position"/></td>
<td>
	<select name="card.position">
		<option value="1" <c:if test="${card.position=='1'}">selected="selected"</c:if>>1</option>
		<option value="2" <c:if test="${card.position=='2'}">selected="selected"</c:if>>2</option>
		<option value="3" <c:if test="${card.position=='3'}">selected="selected"</c:if>>3</option>
		<option value="4" <c:if test="${card.position=='4'}">selected="selected"</c:if>>4</option>
		<option value="5" <c:if test="${card.position=='5'}">selected="selected"</c:if>>5</option>
		<option value="6" <c:if test="${card.position=='6'}">selected="selected"</c:if>>6</option>
		<option value="7" <c:if test="${card.position=='7'}">selected="selected"</c:if>>7</option>
		<option value="8" <c:if test="${card.position=='8'}">selected="selected"</c:if>>8</option>
		<option value="9" <c:if test="${card.position=='9'}">selected="selected"</c:if>>9</option>
		<option value="10" <c:if test="${card.position=='10'}">selected="selected"</c:if>>10</option>
	</select>
</td>
</tr>

<tr>
<td class="tl"><fmt:message key="WineJarId"/></td>
<td>
<select name="card.wineJarId">
	<c:forEach var="items" items="${wineJars}" varStatus="s">
		<option value="${items.wineJar.id}"

		<c:if test="${items.wineJar.id==card.wineJarId}">
			selected="selected"
		</c:if>
			>
		[${items.winery.enterpriseName}]/[${items.wineJar.jarNumber}]
		</option>
	--</c:forEach>
</select>
</td>
</tr>

</tbody>

</table>
</td>
</tr>
</table>
</div>

<jsp:include page="../../incl/g_footer.jsp" />
</div>
</form>
</body>
</html>
</fmt:bundle>
