<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<cpp:defineObjects/>
<cpp:element var="model" type="com.composum.pages.components.model.teaser.Teaser" scope="request"
             tagName="none">
    <cpp:dropZone property="link" filter="page:site">
        <cpn:div test="${not empty model.title||not empty model.subtitle}" tagName="h2"
                 class="${modelCSS}_text-block section-heading mb-4">
            <cpn:text tagName="span" value="${model.subtitle}" class="section-heading-upper"/>
            <cpn:text tagName="span" value="${model.title}" class="section-heading-lower"/>
        </cpn:div>
        <cpn:text type="rich" class="${modelCSS}_text mb-3" value="${model.text}"/>
        <cpn:div test="${model.hasLink}" class="intro-button mx-auto">
            <cpn:link body="true" class="${modelCSS}_link btn btn-primary btn-xl"
                      href="${model.linkUrl}" target="${model.linkTarget}"
                      title="${model.linkTitle}">${model.linkTitle}</cpn:link>
        </cpn:div>
    </cpp:dropZone>
</cpp:element>
