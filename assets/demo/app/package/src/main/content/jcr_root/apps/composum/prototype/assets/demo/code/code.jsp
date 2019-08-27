<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<sling:defineObjects/>
<cpn:component id="code" type="com.composum.prototype.assets.example.CodeBean">
    <div class="composum-prototype-assets-example-code ${code.cssClasses}">
        <sling:include replaceSelectors="${code.renderType}"/>
    </div>
</cpn:component>
