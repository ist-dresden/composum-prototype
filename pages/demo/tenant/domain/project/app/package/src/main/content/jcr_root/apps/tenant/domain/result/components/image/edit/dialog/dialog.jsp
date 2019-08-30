<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog title="Element Properties">
    <cpp:widget label="Image" property="imageRef" type="imagefield"
                hint="the path to the image asset in the repository or an URL"/>
    <cpp:widget label="Title" property="title" type="textfield" i18n="true"
                hint="the title text normally shown as the elements tooltip"/>
    <div class="row">
        <div class="col col-xs-8">
            <cpp:widget label="Alt Text" property="alt" type="textfield" i18n="true"
                        hint="the text used as alternative content in text based view"/>
        </div>
        <div class="col col-xs-4">
            <cpp:widget label="Confidentiality" property="confidentiality"
                        type="confidentiality" required="false"/>
        </div>
    </div>
</cpp:editDialog>
