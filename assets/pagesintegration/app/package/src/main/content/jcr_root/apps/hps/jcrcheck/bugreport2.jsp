<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="java.util.Map" %>
<%@ page import="javax.jcr.*" %>
<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %>
<%-- view-source:http://localhost:9090/apps/hps/jcrcheck.bugreport2.html --%>
<sling:defineObjects/>
<%
    final String PATH = "/tmp/hps/uuidcheck";
    final String PATH2 = "/tmp/hps/uuidcheck/dst";
    Session session = resourceResolver.adaptTo(Session.class);

    Resource parentResource = resourceResolver.getResource(PATH);
    Resource child = resourceResolver.create(parentResource, "child" + System.currentTimeMillis(),
            Map.of("nt:primaryType", "sling:Folder", "jcr:mixinTypes", new String[]{"mix:referenceable"}));
    resourceResolver.commit();

    String id = child.getValueMap().get("jcr:uuid", String.class);

    // session.getNodeByIdentifier(id); // OK, works as expected here.

    Resource parentResource2 = resourceResolver.getResource(PATH2);
    resourceResolver.move(child.getPath(), PATH2);
    resourceResolver.commit();

    session.getNodeByIdentifier(id); // Throws ItemNotFoundException!

%>
DONE 2b <%= this %>
