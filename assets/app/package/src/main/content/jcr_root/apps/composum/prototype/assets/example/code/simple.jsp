<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<sling:defineObjects/>
<cpn:component id="code" type="com.composum.prototype.assets.example.CodeBean">
    <div class="composum-prototype-assets-example-code_content-block">
                <pre class="composum-prototype-assets-example-code_content"><code
                        class="${code.codeLanguage}"><cpn:text value="${code.code}"/></code></pre>
    </div>
    <cpn:text test="${code.hasCopyright}" value="${code.copyright}"
              classes="composum-prototype-assets-example-code_footer simple-footer"/>
</cpn:component>
