<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:element var="model" type="com.composum.pages.commons.model.Element">
    <cpp:include path="image" resourceType="composum/prototype/pages/simple/element/image"/>
    <div class="${modelCSS}_text-wrapper">
        <cpn:text tagName="h3" class="${modelCSS}_title" property="title" />
        <cpn:text class="${modelCSS}_text text-align-${model.properties.textAlign}" property="text" type="rich"/>
    </div>
</cpp:element>
