<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sling:defineObjects/>
<cpn:component id="code" type="com.composum.prototype.assets.demo.CodeBean">
    <div class="composum-prototype-assets-example-code_panel panel panel-default">
        <c:if test="${code.showHeading}">
            <div class="composum-prototype-assets-example-code_heading panel-heading">
                <cpn:text tagName="span" class="composum-prototype-assets-example-code_title" value="${code.title}"/>
                <c:if test="${code.showLanguage}">
                    <cpn:text tagName="span" class="composum-prototype-assets-example-code_language badge"
                              value="${code.codeLanguage}"/>
                </c:if>
                <c:if test="${code.collapsible}">
                    <cpn:text tagName="button"
                              class="composum-prototype-assets-example-code_button btn btn-xs btn-default composum-prototype-assets-example-code_expand"
                              value="expand code"/>
                    <cpn:text tagName="button"
                              class="composum-prototype-assets-example-code_button btn btn-xs btn-default composum-prototype-assets-example-code_collapse"
                              value="collapse code"/>
                </c:if>
            </div>
        </c:if>
        <div class="composum-prototype-assets-example-code_content-block panel-body">
                <pre class="composum-prototype-assets-example-code_content"><code
                        class="${code.codeLanguage}"><cpn:text value="${code.code}"/></code></pre>
        </div>
        <c:if test="${code.hasCopyright}">
            <cpn:text class="composum-prototype-assets-example-code_footer panel-footer" value="${code.copyright}"/>
        </c:if>
    </div>
</cpn:component>
