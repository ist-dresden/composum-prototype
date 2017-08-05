package com.composum.prototype.assets.example;

import com.composum.sling.core.AbstractSlingBean;
import com.composum.sling.core.BeanContext;
import org.apache.sling.api.resource.Resource;

import java.util.List;

/**
 * a simple text component which can handle HTML elements within the text
 */
public class TextBean extends AbstractSlingBean {

    private transient List<Resource> content;

    public TextBean(BeanContext context, Resource resource) {
        super(context, resource);
    }

    public TextBean(BeanContext context) {
        super(context);
    }

    public TextBean() {
        super();
    }

    private transient String subtitle;
    private transient String text;

    public String getSubtitle() {
        if (subtitle == null) {
            subtitle = getProperty("subtitle", "");
        }
        return subtitle;
    }

    public String getText() {
        if (text == null) {
            text = getProperty("text", "");
        }
        return text;
    }
}
