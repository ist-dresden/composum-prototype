<%@ page import="com.composum.sling.core.util.ResourceUtil" %>
<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="javax.jcr.Session" %>
<%@page session="false" pageEncoding="UTF-8" %>
<%-- view-source:http://localhost:9090/apps/hps/jcrcheck.cleanup.html --%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<sling:defineObjects/>
<%
    String PATH = "/tmp/hps/uuidcheck";
    Session session = resourceResolver.adaptTo(Session.class);
    String destAbsPath = PATH + "/destination/child";
%>
<%
    Resource parentResource = resourceResolver.getResource(PATH);
    if (parentResource != null) {
        resourceResolver.delete(parentResource);
        resourceResolver.commit();
    }
    parentResource = resourceResolver.getResource(PATH);
    if (parentResource != null) throw new IllegalStateException("Not deleted");

    parentResource = ResourceUtil.getOrCreateResource(resourceResolver, PATH, "nt:unstructured");
    parentResource = ResourceUtil.getOrCreateResource(resourceResolver, PATH + "/src", "nt:unstructured");
    parentResource = ResourceUtil.getOrCreateResource(resourceResolver, PATH + "/dst", "nt:unstructured");
    resourceResolver.commit();

%>
CLEANUP DONE
