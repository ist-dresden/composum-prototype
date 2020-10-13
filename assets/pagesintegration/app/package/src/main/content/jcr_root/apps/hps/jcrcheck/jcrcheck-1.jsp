<%@ page import="com.composum.sling.core.util.ResourceUtil" %>
<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="javax.jcr.Node" %>
<%@ page import="javax.jcr.Session" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.sling.api.resource.ModifiableValueMap" %>
<%@page session="false" pageEncoding="UTF-8" %>
<%-- view-source:http://localhost:9090/apps/hps/jcrcheck.html --%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<sling:defineObjects/>
<%!
%>
<%
    final String PATH = "/tmp/hps/uuidcheck";
    Resource parentResource = resourceResolver.getResource(PATH);
    if (parentResource != null) {
        resourceResolver.delete(parentResource);
        resourceResolver.commit();
    }
    parentResource = resourceResolver.getResource(PATH);
    if (parentResource != null) throw new IllegalStateException();

    parentResource = ResourceUtil.getOrCreateResource(resourceResolver, PATH);
    // Resource child = resourceResolver.create(parentResource, "child", Map.of("nt:primaryType", "sling:Folder", "jcr:mixinTypes", new String[]{"mix:versionable"}));
    resourceResolver.commit();
    resourceResolver.refresh();

    Session session = resourceResolver.adaptTo(Session.class);
    Node parent = session.getNode(PATH);
    // Node parent = parentResource.adaptTo(Node.class);
    Node child = parent.addNode("child", "sling:Folder");
    // session.save();
    // resourceResolver.commit();
    child.addMixin("mix:versionable");
    session.save();
    // resourceResolver.commit();

    session.move(child.getPath(), PATH + "/moved");
    session.save();
    resourceResolver.refresh();
    // resourceResolver.commit();


%>
hps DONE <%= this %>
