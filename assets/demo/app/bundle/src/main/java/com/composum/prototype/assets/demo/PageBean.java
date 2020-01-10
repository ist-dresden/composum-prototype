package com.composum.prototype.assets.demo;

import com.composum.sling.core.AbstractSlingBean;
import com.composum.sling.core.BeanContext;
import org.apache.sling.api.resource.Resource;

/**
 * Created by rw on 20.02.16.
 */
public class PageBean extends AbstractSlingBean {

    public PageBean(BeanContext context, Resource resource) {
        super(context, resource);
    }

    public PageBean(BeanContext context) {
        super(context);
    }

    public PageBean() {
        super();
    }
}
