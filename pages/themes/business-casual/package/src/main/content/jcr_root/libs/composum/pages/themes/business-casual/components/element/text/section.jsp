<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:element var="model" type="com.composum.pages.components.model.text.Text" scope="request"
             cssAdd="@{modelCSS}_align-@{model.alignment} page-section cta">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 mx-auto">
                <div class="cta-inner text-${model.alignment} rounded">
                    <cpn:div tagName="h2" test="${not empty model.title||not empty model.properties.subtitle}"
                             class="${modelCSS}_titles section-heading mb-4">
                        <cpn:text tagName="span" value="${model.properties.subtitle}" class="section-heading-upper"/>
                        <cpn:text tagName="span" value="${model.title}" class="section-heading-lower"/>
                    </cpn:div>
                    <cpn:text class="${modelCSS}_text mb-0" value="${model.text}" type="rich"/>
                </div>
            </div>
        </div>
    </div>
</cpp:element>