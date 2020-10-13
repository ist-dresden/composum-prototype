<%@ page import="com.composum.sling.core.util.ResourceUtil" %>
<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="javax.jcr.*" %>
<%@ page import="java.util.Map" %>
<%@page session="false" pageEncoding="UTF-8" %>
<%-- view-source:http://localhost:9090/apps/hps/jcrcheck.bugrecheck.html --%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<sling:defineObjects/>
<html><p>
<%!
    String nodeInfo(String loc, Session session, String path) throws RepositoryException {
        try {
            StringBuilder buf = new StringBuilder();
            buf.append(loc).append(": ");
            Node node;
            try {
                node = session.getNode(path);
            } catch (PathNotFoundException e) {
                return buf.append(" no node at ").append(path).append("<hr>").toString();
            }
            if (node != null) buf.append("Node found at ").append(path);
            String id = node.getUUID();
            buf.append(" with id ").append(id);
            try {
                Node retrieved = session.getNodeByIdentifier(id);
                buf.append(" and retrieved as ").append(retrieved.getPath());
            } catch (PathNotFoundException | ItemNotFoundException | RuntimeException e) {
                buf.append(" <br>but not found by id : " + e);
            }
            return buf.append("<hr>").toString();
        } catch (Exception e) {
            throw new IllegalStateException("loc: " + loc, e);
        }
    }
%>
<%
    final String PATH = "/tmp/hps/uuidcheck";
    String name = "child" + System.currentTimeMillis();
    String dstPath = PATH + "/moved" + System.currentTimeMillis();
    Session session = resourceResolver.adaptTo(Session.class);
%>
<%
    Resource parentResource = resourceResolver.getResource(PATH);
    // Resource child = resourceResolver.create(parentResource, name, Map.of("nt:primaryType", "sling:Folder", "jcr:mixinTypes", new String[]{"mix:referenceable"}));


    Node parent = session.getNode(PATH);
    Node child = parent.addNode("child", "sling:Folder"); child.addMixin("mix:referenceable");

    String createdinfo = nodeInfo("Created", session, child.getPath());

    resourceResolver.commit();
    resourceResolver.refresh();

    session.move(child.getPath(), dstPath);
    // session.save();
    resourceResolver.commit();

%>
<%= createdinfo%>
<%= nodeInfo("Moved", session, dstPath) %>
bugrecheck done <%= this %>
</p></html>
