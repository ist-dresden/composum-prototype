<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<cpp:defineObjects/>
<cpp:element var="title" type="com.composum.pages.components.model.text.Title"
             test="@{title.editMode || title.valid}">
    <c:choose>
        <c:when test="${title.valid}">
            <sling:call script="embedded.jsp"/>
        </c:when>
        <c:otherwise>
            <cpp:include replaceSelectors="placeholder"/>
        </c:otherwise>
    </c:choose>
</cpp:element>
