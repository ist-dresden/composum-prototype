<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<div class="row">
    <div class="col col-xs-5">
        <cpp:widget label="Title" property="title" type="textfield" i18n="true"/>
    </div>
    <div class="col col-xs-7">
        <cpp:widget label="Subtitle" property="subtitle" type="textfield" i18n="true"/>
    </div>
</div>
