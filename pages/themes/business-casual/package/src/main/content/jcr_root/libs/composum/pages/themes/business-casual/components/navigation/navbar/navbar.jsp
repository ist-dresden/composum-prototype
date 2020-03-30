<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<cpp:defineObjects/>
<cpp:element var="menu" type="com.composum.pages.components.model.navigation.NavbarMenu" mode="none"
             cssBase="composum-pages-components-navigation-navbar" role="navigation"
             cssAdd="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
    <div class="${menuCSS}_container container">
        <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
           href="#">${cpn:text(currentPage.title)}</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="${menuCSS}_navbar-nav navbar-nav mx-auto">
                <cpp:include path="${currentPage.themeRoot.path}"
                             resourceType="composum/pages/components/navigation/menuitem"/>
                <c:forEach items="${menu.menuItems}" var="item">
                    <cpp:include path="${item.content.path}"
                                 resourceType="composum/pages/components/navigation/menuitem"/>
                </c:forEach>
            </ul>
        </div>
    </div>
</cpp:element>
