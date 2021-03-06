<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sling:defineObjects/>
<cpn:component id="model" type="com.composum.prototype.assets.demo.TextBean">
    <div class="example text-component">
        <cpn:text tagName="h3" class="title" value="${model.title}"/>
        <cpn:text tagName="h4" class="subtitle" value="${model.subtitle}"/>
        <cpn:text class="text" value="${model.text}" escape="false"/><%-- enable embedded HTML --%>
    </div>
</cpn:component>