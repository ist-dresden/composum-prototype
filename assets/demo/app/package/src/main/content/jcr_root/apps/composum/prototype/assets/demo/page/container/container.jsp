<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sling:defineObjects/>
<cpn:component id="parsys" type="com.composum.prototype.assets.example.ContainerBean">
    <div class="row">
        <div class="col col-xs-12">
            <div class="example parsys">
                <c:forEach items="${parsys.content}" var="item">
                    <sling:include resource="${item}"/>
                </c:forEach>
            </div>
        </div>
    </div>
</cpn:component>