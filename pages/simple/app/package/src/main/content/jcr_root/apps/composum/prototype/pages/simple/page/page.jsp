<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<html ${currentPage.htmlLangAttribute} ${currentPage.htmlDirAttribute}
        class="${currentPage.htmlClasses}" data-context-path="${slingRequest.contextPath}">
<cpp:head>
    <cpn:clientlib type="link" category="${currentPage.viewClientlibCategory}"/>
    <cpn:clientlib type="css" category="${currentPage.viewClientlibCategory}"/>
    <cpn:clientlib type="css" test="${currentPage.editMode}" category="${currentPage.editClientlibCategory}"/>
</cpp:head>
<cpp:body>
    <div class="composum-prototype-pages-simple-page_body">
        <cpp:include path="main" resourceType="composum/prototype/pages/simple/container"/>
    </div>
    <cpn:clientlib type="js" category="${currentPage.viewClientlibCategory}"/>
    <cpn:clientlib type="js" test="${currentPage.editMode}" category="${currentPage.editClientlibCategory}"/>
</cpp:body>
</html>
