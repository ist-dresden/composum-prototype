<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sling:defineObjects/>
<cpn:component id="bean" type="com.composum.prototype.assets.demo.PageBean">
    <html>
    <head>
        <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=no"/>
        <cpn:clientlib type="css" category="composum.prototype.assets.demo"/>
    </head>
    <body id="page-content" class="composum-prototype-assets-example-page example page">
    <div class="composum-prototype-assets-example-page_wrapper">
        <sling:include path="jcr:content"/>
    </div>
    <cpn:clientlib type="js" category="composum.prototype.assets.demo"/>
    </body>
    </html>
</cpn:component>
