<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:model var="model" type="com.composum.pages.components.model.text.Title"
           test="@{model.valid && !model.hideTitle}">
    <cpn:div tagName="${model.titleTagName}" class="site-heading text-center text-white d-none d-lg-block">
        <cpn:text tagName="span" value="${model.subtitle}"
                  class="${modelCSS}_subtitle site-heading-upper text-primary mb-3"/>
        <cpn:text tagName="span" value="${model.title}"
                  class="${modelCSS}_title site-heading-lower"/>
    </cpn:div>
</cpp:model>
