<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<!DOCTYPE html>
<html ${currentPage.htmlLangAttribute} ${currentPage.htmlDirAttribute} class="${currentPage.htmlClasses}"
                                                                       data-context-path="${slingRequest.contextPath}"
                                                                       data-locale="${currentPage.locale}">
<cpp:head>
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">
    <sling:call script="head.jsp"/>
</cpp:head>
<cpp:body cssAdd="composum-pages-components-page"
          style="background-image: linear-gradient(rgba(47, 23, 15, 0.65), rgba(47, 23, 15, 0.65)), url(${currentPage.inherited['style/background']});">
    <sling:call script="body.jsp"/>
</cpp:body>
</html>
