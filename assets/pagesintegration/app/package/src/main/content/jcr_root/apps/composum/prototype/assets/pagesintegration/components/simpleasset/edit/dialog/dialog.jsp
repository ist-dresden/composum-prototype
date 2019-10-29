<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog title="Asset Properties">
    <cpp:widget label="Asset" property="assetPath" type="pathfield"
                hint="the path to the image asset in the repository or an URL"/>
    <cpp:widget label="Variation" property="variation" type="textfield"/>
    <cpp:widget label="Rendition" property="rendition" type="textfield"/>
</cpp:editDialog>
