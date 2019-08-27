<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sling:defineObjects/>
<cpn:component id="image" type="com.composum.prototype.assets.example.AssetBean">
    <div class="composum-prototype-assets-example-image-asset asset image ${image.variation} ${image.rendition}">
        <figure>
            <div class="image-background"
                 style="background-image: url(${cpn:url(slingRequest,'/libs/composum/nodes/console/browser/images/image-background.png')})">
                <img src="${image.imageUrl}">
            </div>
        </figure>
    </div>
</cpn:component>
