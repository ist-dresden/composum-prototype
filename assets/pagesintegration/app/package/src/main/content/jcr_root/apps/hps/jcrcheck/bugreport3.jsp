<%@ page import="javax.jcr.ItemNotFoundException" %>
<%@ page import="javax.jcr.Node" %>
<%@ page import="javax.jcr.Session" %>
<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %>
<%-- view-source:http://localhost:9090/apps/hps/jcrcheck.bugreport2.html --%>
<sling:defineObjects/>
<%
    final String PATH = "/tmp/hps/uuidcheck/src";
    final String PATH2 = "/tmp/hps/uuidcheck/dst";
    Session session = resourceResolver.adaptTo(Session.class);

    Node parent = session.getNode(PATH);
    String name = "child" + System.currentTimeMillis();
    Node child = parent.addNode(name);
    child.addMixin("mix:referenceable");
    session.save();
    session.refresh(false);

    String id = child.getIdentifier();
    System.out.println(id);
    session.getNodeByIdentifier(id); // OK, works as expected here.

    session.move(child.getPath(), PATH2 + "/" + name);
    session.save();
    session.refresh(false);
    System.gc();
    Thread.sleep(100);
    session.refresh(false);

    session.getNodeByIdentifier(id); // often throws ItemNotFoundException!

%>
DONE <%= this %>
