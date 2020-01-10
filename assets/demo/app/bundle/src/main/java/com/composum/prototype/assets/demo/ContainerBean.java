package com.composum.prototype.assets.demo;

import com.composum.sling.core.AbstractSlingBean;
import com.composum.sling.core.BeanContext;
import org.apache.sling.api.resource.Resource;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by rw on 20.02.16.
 */
public class ContainerBean extends AbstractSlingBean {

    private transient List<Resource> content;

    public ContainerBean(BeanContext context, Resource resource) {
        super(context, resource);
    }

    public ContainerBean(BeanContext context) {
        super(context);
    }

    public ContainerBean() {
        super();
    }

    public List<Resource> getContent() {
        if (content == null) {
            content = new ArrayList<>();
            for (Resource child : resource.getChildren()) {
                content.add (child);
            }
        }
        return content;
    }
}
