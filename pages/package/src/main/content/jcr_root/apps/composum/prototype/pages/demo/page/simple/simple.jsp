<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<cpp:defineObjects/>
<html>
<cpp:head>
    <cpn:clientlib type="css" category="composum.prototype.pages.site.view"/>
</cpp:head>
<cpp:body>
    <sling:call script="main.jsp"/>
    <cpn:clientlib type="js" category="composum.prototype.pages.site.view"/>
</cpp:body>
</html>
