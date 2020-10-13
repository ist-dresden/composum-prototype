<%@ page import="com.composum.sling.core.util.ResourceUtil" %>
<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="java.util.Map" %>
<%@ page import="javax.jcr.*" %>
<%@page session="false" pageEncoding="UTF-8" %>
<%-- view-source:http://localhost:9090/apps/hps/jcrcheck.html --%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<sling:defineObjects/>
<%!
    final String PATH = "/tmp/hps/uuidcheck";
    String nodeInfo(Session session) throws RepositoryException {
        try {
            String id = session.getNode(PATH + "/moved").getUUID();
            Node retrieved = session.getNodeByIdentifier(id);
            return retrieved.getPath() + " at " + retrieved.getUUID();
        } catch (PathNotFoundException | ItemNotFoundException e) {
            return "not found";
        }
    }
%>
<%
    Session session = resourceResolver.adaptTo(Session.class);
%>
Before found: <%= nodeInfo(session) %>
<%
    Resource parentResource = resourceResolver.getResource(PATH);
    if (parentResource != null) {
        resourceResolver.delete(parentResource);
        resourceResolver.commit();
    }
    parentResource = resourceResolver.getResource(PATH);
    if (parentResource != null) throw new IllegalStateException("Not deleted");

    parentResource = ResourceUtil.getOrCreateResource(resourceResolver, PATH);
    // Resource child = resourceResolver.create(parentResource, "child", Map.of("nt:primaryType", "sling:Folder", "jcr:mixinTypes", new String[]{"mix:versionable"}));
    resourceResolver.commit();
    resourceResolver.refresh();

    Node parent = session.getNode(PATH);
    Node child = parent.addNode("child", "sling:Folder"); child.addMixin("mix:versionable");

    session.move(child.getPath(), PATH + "/moved");
    session.save();
    // resourceResolver.commit();

%>
Found: <%= nodeInfo(session) %>
hps DONE <%= this %>
