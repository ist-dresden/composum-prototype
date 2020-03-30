<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:model var="pageContent" type="com.composum.pages.commons.model.PageContent" scope="request">
    <div class="composum-pages-components-page_content">
        <div class="composum-pages-components-page_content_top">
            <cpp:include path="top" resourceType="composum/pages/components/container/iparsys"/>
        </div>
        <sling:call script="navbar.jsp"/>
        <div class="composum-pages-components-page_content_main">
            <cpp:include path="main" resourceType="composum/pages/components/container/parsys"/>
        </div>
        <footer class="composum-pages-components-page_content_bottom footer text-faded text-center py-5">
            <div class="container">
                <cpp:include path="bottom" resourceType="composum/pages/components/container/iparsys"/>
            </div>
        </footer>
    </div>
    <sling:call script="token.jsp"/>
    <sling:call script="script.jsp"/>
</cpp:model>
