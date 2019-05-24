<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<%
	String path = request.getContextPath();
	String serverName = request.getServerName();
	int serverPort = request.getServerPort();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String baseServer = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>

<script type="text/javascript">
var BASE_PATH =  '<%=basePath%>';
var SERVER_NAME =  '<%=serverName%>';
var SERVER_PORT = '<%=serverPort%>'; 
var PATH = '<%=path%>';
var BASE_SERVER = '<%=baseServer%>';
</script>

