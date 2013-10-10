<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/incl/static.inc"%>
<fmt:bundle basename="MessageBundle">
<html>
<head>
<title><fmt:message key="Card"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link id="skinCss" href="jsp/public/ISCSSobjects_style5.css" type="text/css" rel="stylesheet">   
<script type="text/javascript" src="jsp/js/pop-lookup.js"></script>
<script type="text/javascript" src="jsp/js/util.js"></script>
<link type="text/css" rel="stylesheet" href="skins/dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen"/>
<script type="text/javascript" src="skins/dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>
<script type="text/javascript" src="jsp/public/skin.js"></script>
</head>

<body>
<form method="post">
<div id="gtop">
	<jsp:include page="../../incl/actionb.jsp">
		<jsp:param name="key" value="Close"/>
		<jsp:param name="action" value="Card.do"/>
		<jsp:param name="method" value="listCard"/>
	</jsp:include>
	
	<jsp:include page="../../incl/actionb.jsp">
		<jsp:param name="key" value="Confirm"/>
		<jsp:param name="action" value="Card.do"/>
		<jsp:param name="method" value="processActivate"/>
	</jsp:include>
</div>

<div id="container">

<%@ include file="../../incl/b_message.jsp" %>

<input type="hidden" name="alength" value="${fun:length(cards)}"/>
<input type="hidden" name="winery.id" value="${winery.id}"/>

<div>
<table  class="twrap">
<tr>
<td>

<table class="modify">
<caption><fmt:message key="Activate"/>: ${winery.enterpriseName}</caption>

<tbody>

<c:forEach var="item" items="${cards}" varStatus="status">
<tr <c:if test="${status.index%2==0 }">bgcolor="#ffffff"</c:if> >

<td><c:out value="${item.card.rfidcode }"/><input type="hidden" name="cardId${status.index}" value="${item.card.id }"/></td>

<td>
	<input type="text" name="wineJarId${status.index}"/>
	<img src="jsp/images/miniSearch.gif" border=0 alt="<fmt:message key="choosedate"/>" onclick="openLookup('jsp/lookup/wineJarLookup.jsp?wineryId=${winery.id}','forms[0].wineJarId${status.index}');return false;">
</td>

<td><fmt:message key="Position"/></td>
<td>
	<select name="cardPosition${status.index}">
		<option value="1" selected="selected">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
	</select>
</td>

</tr>
</c:forEach>

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
