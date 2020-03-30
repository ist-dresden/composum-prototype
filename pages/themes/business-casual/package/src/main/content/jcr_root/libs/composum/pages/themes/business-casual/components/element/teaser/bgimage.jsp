<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:element var="model" type="com.composum.pages.components.model.teaser.Teaser" scope="request"
             cssAdd="page-section clearfix">
    <div class="container">
        <div class="intro">
            <cpp:dropZone property="image/imageRef" filter="asset:image">
                <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="${model.imageUrl}" alt="${model.image.alt}">
            </cpp:dropZone>
            <div class="${modelCSS}_content intro-text left-0 text-center bg-faded p-5 rounded">
                <cpp:include replaceSelectors="${model.textSelector}"/>
            </div>
        </div>
    </div>
</cpp:element>
