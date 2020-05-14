<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:model var="model" type="com.composum.pages.commons.model.Image">
    <cpp:dropZone property="imageRef" filter="asset:image">
        <cpn:image src="${model.imageRef}" alt="${model.alt}" title="${model.title}"
                   class="${modelCSS}_picture img-fluid rounded about-heading-img mb-3 mb-lg-0"/>
    </cpp:dropZone>
</cpp:model>
