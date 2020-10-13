<%@ page import="com.composum.sling.core.util.ResourceUtil" %>
<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="javax.jcr.*" %>
<%@ page import="java.util.Map" %>
<%@page session="false" pageEncoding="UTF-8" %>
<%-- view-source:http://localhost:9090/apps/hps/jcrcheck.html --%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<sling:defineObjects/>
<html><p>
<%!
    String nodeInfo(String loc, Session session, String path) throws RepositoryException {
        try {
            StringBuilder buf = new StringBuilder();
            buf.append(loc).append(":");
            Node node;
            try {
                node = session.getNode(path);
            } catch (PathNotFoundException e) {
                return buf.append(" no node at ").append(path).append("<hr>").toString();
            }
            try {
                if (node != null) buf.append("Node at ").append(path);
                String id = node.getUUID();
                buf.append(" id ").append(id);
                Node retrieved = session.getNodeByIdentifier(id);
                buf.append(" retrieved as ").append(retrieved.getPath());
            } catch (PathNotFoundException | ItemNotFoundException | RuntimeException e) {
                buf.append(" <br> : " + e);
            }
            return buf.append("<hr>").toString();
        } catch (Exception e) {
            throw new IllegalStateException("loc: " + loc, e);
        }
    }
%>
<%
    String PATH = "/tmp/hps/uuidcheck";
    Session session = resourceResolver.adaptTo(Session.class);
    String name = "child" + System.currentTimeMillis();
    String destAbsPath = PATH + "/destination/" + name;
%>
<%= nodeInfo("Before", session, destAbsPath) %>
<%
    Resource parentResource = resourceResolver.getResource(PATH);
    if (1 == 0) {
        if (parentResource != null) {
            resourceResolver.delete(parentResource);
            resourceResolver.commit();
        }
        parentResource = resourceResolver.getResource(PATH);
        if (parentResource != null) throw new IllegalStateException("Not deleted");
    }

    parentResource = ResourceUtil.getOrCreateResource(resourceResolver, PATH);
    resourceResolver.commit();
    // session.save();
    resourceResolver.refresh();
    // session.refresh(false);

    Resource child = resourceResolver.create(parentResource, name, Map.of("nt:primaryType", "sling:Folder", "jcr:mixinTypes", new String[]{"mix:versionable"}));

    resourceResolver.commit();
    // session.save();
    resourceResolver.refresh();
    // session.refresh(false);

    String createdinfo = nodeInfo("Created", session, child.getPath());

    Node parent = session.getNode(PATH);
    // Node child = parent.addNode("child", "sling:Folder"); child.addMixin("mix:versionable");

    Resource parentResource2 = ResourceUtil.getOrCreateResource(resourceResolver, PATH + "/destination");
    resourceResolver.move(child.getPath(), parentResource2.getPath());

    // session.move(child.getPath(), destAbsPath);
    // session.save();
    resourceResolver.commit();
    resourceResolver.refresh();

%>
<%= createdinfo%>
<%= nodeInfo("Moved", session, destAbsPath) %>
HPS DONE <%= this %>
</p></html>
