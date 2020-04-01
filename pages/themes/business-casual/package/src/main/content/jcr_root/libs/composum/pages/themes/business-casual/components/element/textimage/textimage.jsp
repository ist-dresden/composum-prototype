<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<cpp:defineObjects/>
<cpp:element var="model" type="com.composum.pages.components.model.text.TextImage">
    <c:choose>
        <c:when test="${model.imagePosition=='top'||model.imageBottom}">
            <section class="page-section about-heading">
                <div class="container">
                    <cpp:include test="${!model.imageBottom}" path="image" replaceSelectors="about"
                                 resourceType="composum/pages/themes/business-casual/components/element/textimage/image"/>
                    <div class="about-heading-content">
                        <div class="row">
                            <div class="col-xl-9 col-lg-10 mx-auto">
                                <div class="bg-faded text-${model.alignment} rounded p-5">
                                    <cpn:div tagName="h2" test="${not empty model.title||not empty model.properties.subtitle}"
                                             class="${modelCSS}_title section-heading mb-4">
                                        <cpn:text tagName="span" value="${model.properties.subtitle}"
                                                  class="section-heading-upper"/>
                                        <cpn:text tagName="span" value="${model.title}"
                                                  class="section-heading-lower"/>
                                    </cpn:div>
                                    <cpn:text class="${modelCSS}_text text-${model.alignment} mb-0"
                                              value="${model.text}" type="rich"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <cpp:include test="${model.imageBottom}" path="image" replaceSelectors="about"
                                 resourceType="composum/pages/themes/business-casual/components/element/textimage/image"/>
                </div>
            </section>
        </c:when>
        <c:otherwise>
            <section class="page-section">
                <div class="container">
                    <div class="product-item">
                        <div class="product-item-title d-flex">
                            <div class="bg-faded p-5 d-flex m${model.imagePosition=='left'?'l':'r'}-auto text-${model.alignment} rounded">
                                <cpn:div tagName="h2" test="${not empty model.title||not empty model.properties.subtitle}"
                                         class="${modelCSS}_title section-heading mb-4">
                                    <cpn:text tagName="span" value="${model.properties.subtitle}"
                                              class="section-heading-upper"/>
                                    <cpn:text tagName="span" value="${model.title}"
                                              class="section-heading-lower"/>
                                </cpn:div>
                            </div>
                        </div>
                        <cpp:include path="image"
                                     resourceType="composum/pages/themes/business-casual/components/element/textimage/image"/>
                        <div class="product-item-description d-flex m${model.imagePosition=='left'?'r':'l'}-auto">
                            <div class="bg-faded p-5 text-${model.alignment} rounded">
                                <cpn:text class="${modelCSS}_text mb-0" value="${model.text}" type="rich"/>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:otherwise>
    </c:choose>
</cpp:element>
