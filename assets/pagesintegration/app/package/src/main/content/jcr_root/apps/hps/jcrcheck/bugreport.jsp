<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="java.util.Map" %>
<%@ page import="javax.jcr.*" %>
<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %>
<%-- view-source:http://localhost:9090/apps/hps/jcrcheck.bugreport.html --%>
<sling:defineObjects/>
<%
    final String PATH = "/tmp/hps/uuidcheck";

    Session session = resourceResolver.adaptTo(Session.class);
    Resource parentResource = resourceResolver.getResource(PATH);
    Node parentNode = session.getNode(PATH);

    Resource child = resourceResolver.create(parentResource, "child",
            Map.of("nt:primaryType", "sling:Folder", "jcr:mixinTypes", new String[]{"mix:referenceable"}));
    // Node child = parent.addNode("child", "sling:Folder"); child.addMixin("mix:referenceable");

    String id = session.getNode(child.getPath()).getUUID();
    session.getNodeByIdentifier(id); // OK.

    resourceResolver.commit();
    session.getNodeByIdentifier(id); // OK.

    session.move(child.getPath(), PATH + "/moved");
    session.save();
    // resourceResolver.commit();

    session.getNodeByIdentifier(id); // Throws ItemNotFoundException!

%>
DONE <%= this %>

Jackrabbit Versoin
