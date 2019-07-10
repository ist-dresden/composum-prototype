<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="model" type="com.composum.pages.commons.model.Element"
                title="Text and Image Properties">
    <cpp:editDialogTab tabId="text" label="Text">
        <div class="row">
            <div class="col col-xs-9">
                <cpp:widget label="Subtitle" property="title" type="textfield"/>
            </div>
            <div class="col col-xs-3">
                <cpp:widget label="Text Alignment" property="textAlign" type="select"
                            options="left,right,center,justify"/>
            </div>
        </div>
        <cpp:widget label="Text" property="text" type="richtext" height="300px" i18n="true"/>
    </cpp:editDialogTab>
    <cpp:editDialogTab tabId="image" label="Image">
        <cpp:include path="image" resourceType="composum/prototype/pages/simple/element/image"
                     subtype="edit/dialog" replaceSelectors="embedded"/>
    </cpp:editDialogTab>
</cpp:editDialog>
