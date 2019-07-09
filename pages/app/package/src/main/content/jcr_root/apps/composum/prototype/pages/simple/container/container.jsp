<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<cpp:defineObjects/>
<cpp:container var="container" type="com.composum.pages.commons.model.Container">
    <c:forEach items="${container.elements}" var="element">
        <cpp:include resource="${element.resource}"/>
    </c:forEach>
</cpp:container>
