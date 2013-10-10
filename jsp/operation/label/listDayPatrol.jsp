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
<script type="text/javascript" src="jsp/js/calendar.js"></script>
<script type="text/javascript" src="jsp/public/skin.js"></script>
</head>

<body>
<c:url value="/DayCardJob.do" var="defURL">
	<c:param name="method">listDayPatrol</c:param>
</c:url>

<form method="post" action="${defURL }">
<div id="gtop">
	<jsp:include page="../../incl/action.jsp">
		<jsp:param name="type" value="find"/>
		<jsp:param name="key" value="List"/>
		<jsp:param name="action" value="DayCardJob.do"/>
		<jsp:param name="method" value="listDayPatrol"/>
	</jsp:include>
	<jsp:include page="../../incl/action.jsp">
		<jsp:param name="type" value="print"/>
		<jsp:param name="key" value="List"/>
		<jsp:param name="action" value="DayCardJob.do"/>
		<jsp:param name="aparams" value="reportName=${reportName }&reportType=pdf"/>
		<jsp:param name="method" value="printPatrol"/>
	</jsp:include>
	<jsp:include page="../../incl/action.jsp">
		<jsp:param name="type" value="export"/>
		<jsp:param name="key" value="List"/>
		<jsp:param name="action" value="DayCardJob.do"/>
		<jsp:param name="aparams" value="reportName=${reportName }&reportType=xls"/>
		<jsp:param name="method" value="exportPatrol"/>
	</jsp:include>
</div>

<div id="container">

<%@ include file="../../incl/b_message.jsp" %>

<div>
<table  class="twrap">
<tr>
<td>

<table class="st">
<caption><fmt:message key="Card"/></caption>
<tbody>

<tr>
	<td class="textr"><fmt:message key="StartDate"/></td>
	<td><input type="text" name="StartDate" value="${StartDate }" onclick="displayCalendar(this,'yyyy-MM-dd hh:mm:ss');"/></td>

	<td class="textr"><fmt:message key="EndDate"/></td>
	<td><input type="text" name="EndDate" value="${EndDate }" onclick="displayCalendar(this,'yyyy-MM-dd hh:mm:ss');"/></td>
</tr>

<tr>
	<td  class="textr"><fmt:message key="Winery"/></td>
	<td><select name="wineryId" onchange="document.forms[0].submit();">
			<option selected="selected" value="">All</option>
			<c:forEach var="items" items="${winerys}" varStatus="s">
				<option value="${items.winery.id}"
		
				<c:if test="${items.winery.id==param.wineryId}">
					selected="selected"
				</c:if>
					>
				${items.winery.enterpriseName}
				</option>
			--</c:forEach>
		</select>
	</td>
	
	<td  class="textr"><fmt:message key="WineJar"/></td>
	<td>
		<input type="text" name="WineJar" value="${param.WineJar }"/>
		<img src="jsp/images/miniSearch.gif" border=0 alt="<fmt:message key="choosedate"/>" onclick="openLookup('jsp/lookup/wineJarLookup.jsp?wineryId=${param.wineryId}','forms[0].WineJar');return false;">
	</td>
</tr>

</tbody>
</table>
</td>
</tr>

<tr>
<td>

<table class="lt">

<thead>
<!-- 分页 -->
<tr class="lp">
<td colspan="6" >
<%@ include file="../../incl/pageNavigation.jsp"%>
</td>
</tr>

<tr>
<th><fmt:message key="ID"/></th>
<th><fmt:message key="Winery"/></th>
<th><fmt:message key="WineJarId"/></th>
<th><fmt:message key="Rfidcode"/></th>
<th><fmt:message key="Position"/></th>
<th><fmt:message key="Patrol"/></th>
</tr>
</thead>

<tbody>
<c:forEach var="item" items="${cards}" varStatus="status">
<tr  
<c:if test="${item.exitsPatrol==false}">bgcolor="#FFCC33"</c:if>

<c:if test="${item.exitsPatrol==true}">
<c:if test="${item.jobType.id==3}">bgcolor="#FFFF99"</c:if>
<c:if test="${item.jobType.id!=3}">bgcolor="#99CCCC"</c:if>
</c:if>

>

<td>
	<c:url value="/DayCardJob.do" var="listDayCardJob">
		<c:param name="method">listDayCardJob</c:param>
		<c:param name="cardId">${item.card.id }</c:param>
	</c:url>
	<a href="#" onclick="window.open('${listDayCardJob }'); "><fmt:message key="View"/></a>
</td>
<td><c:out value="${item.winery.enterpriseName }"/></td>
<td><c:out value="${item.wineJar.jarNumber }"/></td>
<td><c:out value="${item.card.rfidcode }"/></td>
<td><c:out value="${item.card.position }"/></td>
<td><c:out value="${item.patrol }"/></td>
</tr>

</c:forEach>
</tbody>

<tfoot>
<!-- 分页 -->
<tr class="lp" >
<td colspan="6" >
<%@ include file="../../incl/pageNavigation.jsp"%>
</td>
</tr>
</tfoot>

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