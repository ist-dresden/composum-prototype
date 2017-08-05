package com.composum.prototype.assets.example;

import com.composum.platform.commons.content.service.ContentRefService;
import com.composum.sling.core.AbstractSlingBean;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

public class CodeBean extends AbstractSlingBean {

    private static final Logger LOG = LoggerFactory.getLogger(CodeBean.class);

    public static final String PN_CODE = "code";
    public static final String PN_CODE_REF = "codeRef";
    public static final String PN_CODE_URL = "codeUrl";
    public static final String CODE_ENCODING = "UTF-8";

    public static final String PN_BORDERED = "bordered";
    public static final String PN_COLLAPSIBLE = "collapsible";
    public static final String PN_COLLAPSED = "collapsed";
    public static final String PN_WRAP_LINES = "wrapLines";

    public static final String PN_TITLE = "title";
    public static final String PN_JCR_TITLE = "jcr:title";
    public static final String PN_COPYRIGHT = "copyright";

    public static final String PN_LANGUAGE = "language";
    public static final String PN_SHOW_LANGUAGE = "showLanguage";

    public static final String TYPE_PANEL = "panel";
    public static final String TYPE_SIMPLE = "simple";

    private transient String title;
    private transient String code;
    private transient String copyright;
    private transient String codeLanguage;
    private transient Boolean showLanguage;

    private transient Boolean wrapLines;
    private transient Boolean bordered;
    private transient Boolean collapsible;
    private transient Boolean collapsed;

    public boolean isValid() {
        return StringUtils.isNotBlank(getCode());
    }

    public boolean isBordered() {
        if (bordered == null) {
            bordered = getProperty(PN_BORDERED, Boolean.FALSE);
        }
        return bordered;
    }

    public boolean isCollapsible() {
        if (collapsible == null) {
            collapsible = getProperty(PN_COLLAPSIBLE, Boolean.FALSE);
        }
        return collapsible;
    }

    public boolean isCollapsed() {
        if (collapsed == null) {
            collapsed = getProperty(PN_COLLAPSED, Boolean.FALSE);
        }
        return collapsed;
    }

    public boolean isWrapLines() {
        if (wrapLines == null) {
            wrapLines = getProperty(PN_WRAP_LINES, Boolean.FALSE);
        }
        return wrapLines;
    }

    public boolean isShowHeading() {
        return isCollapsible()
                || StringUtils.isNotBlank(getTitle())
                || isShowLanguage();
    }

    public boolean isUsePanel() {
        return isBordered() || isShowHeading();
    }

    public String getRenderType() {
        return isUsePanel() ? TYPE_PANEL : TYPE_SIMPLE;
    }

    public String getCssClasses() {
        List<String> cssClasses = new ArrayList<>();
        if (isUsePanel()) {
            cssClasses.add("code-panel");
        } else {
            cssClasses.add("code-simple");
        }
        if (isWrapLines()) {
            cssClasses.add("wrap-lines");
        }
        if (isBordered()) {
            cssClasses.add("bordered");
        }
        if (isCollapsible()) {
            cssClasses.add("collapsible");
        }
        if (isCollapsed()) {
            cssClasses.add("collapsed");
        }
        return StringUtils.join(cssClasses, " ");
    }

    public String getTitle() {
        if (title == null) {
            title = getProperty(PN_TITLE, "");
            if (StringUtils.isBlank(title)) {
                title = getProperty(PN_JCR_TITLE, title);
            }
        }
        return title;
    }

    public boolean isHasCopyright() {
        return StringUtils.isNotBlank(getCopyright());
    }

    public String getCopyright() {
        if (copyright == null) {
            copyright = getProperty(PN_COPYRIGHT, "");
        }
        return copyright;
    }

    public boolean isShowLanguage() {
        if (showLanguage == null) {
            showLanguage = getProperty(PN_SHOW_LANGUAGE, Boolean.FALSE)
                    && StringUtils.isNotBlank(getCodeLanguage());
        }
        return showLanguage;
    }

    public String getCodeLanguage() {
        if (codeLanguage == null) {
            codeLanguage = getProperty(PN_LANGUAGE, "");
        }
        return codeLanguage;
    }

    public String getCode() {
        if (code == null) {
            code = getProperty(PN_CODE, "");
            if (StringUtils.isBlank(code)) {
                ContentRefService service = getSling().getService(ContentRefService.class);
                String codeRef = getProperty(PN_CODE_REF, "");
                code = service.getReferencedContent(getResolver(), codeRef);
                if (StringUtils.isBlank(code)) {
                    String codeUrl = getProperty(PN_CODE_URL, "");
                    code = service.getRenderedContent(getRequest(), codeUrl, false);
                }
            }
        }
        return code;
    }
}
