<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:element var="model" type="com.composum.pages.stage.model.edit.FrameElement" mode="none"
             cssAdd="composum-pages-tools">
    <div class="composum-pages-tools_actions btn-toolbar">
        <div class="composum-pages-tools_right-actions">
            <div class="composum-pages-tools_button-group btn-group btn-group-sm" role="group">
                <button type="button" class="fa fa-pencil composum-pages-tools_button btn btn-default"></button>
            </div>
        </div>
    </div>
    <div class="${modelCSS}_panel composum-pages-tools_panel">
        <cpn:text tagName="p" i18n="true" value="My new panel - visible if an Element is selected."/>
        <cpn:text i18n="true" value="the selected element:"/>
        <dl>
            <dt>${cpn:i18n(slingRequest,'Name')}</dt>
            <dd>${cpn:text(model.name)}</dd>
            <dt>${cpn:i18n(slingRequest,'Path')}</dt>
            <dd>${cpn:text(model.pathHint)}</dd>
        </dl>
    </div>
</cpp:element>
