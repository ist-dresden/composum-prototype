<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<cpp:defineObjects/>
<cpp:model var="model" type="com.composum.pages.components.model.text.Text" scope="request">
    <c:choose>
        <c:when test="${model.resource.parent.resourceType=='composum/pages/components/container/iparsys'}">
            <sling:call script="simple.jsp"/>
        </c:when>
        <c:otherwise>
            <sling:call script="section.jsp"/>
        </c:otherwise>
    </c:choose>
</cpp:model>