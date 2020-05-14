<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:element var="model" type="com.composum.pages.commons.model.Image"
             test="@{model.valid||model.editMode}">
    <cpp:dropZone property="imageRef" i18n="true" filter="asset:image">
        <cpn:div test="${model.valid}" class="${modelCSS}_frame">
            <cpn:image class="${modelCSS}_picture" src="${model.imageRef}" alt="${cpn:text(model.alt)}"
                       title="${cpn:text(model.title)}"/>
        </cpn:div>
        <cpn:div test="${!model.valid&&model.editMode}" class="${modelCSS}_placeholder"><i
                class="placeholder-symbol fa fa-image"></i></cpn:div>
    </cpp:dropZone>
</cpp:element>
