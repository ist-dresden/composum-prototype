/*
 * copyright (c) 2015 IST GmbH Dresden, Germany
 *
 * This software may be modified and distributed under the terms of the MIT license.
 */
package com.composum.prototype.assets.example;

import com.composum.sling.core.AbstractSlingBean;
import com.composum.sling.core.BeanContext;
import com.composum.sling.core.util.LinkUtil;
import org.apache.sling.api.resource.Resource;

public class ImageBean extends AbstractSlingBean {

    private transient String imagePath;

    public ImageBean(BeanContext context, Resource resource) {
        super(context, resource);
    }

    public ImageBean() {
    }

    public String getImageUrl() {
        String uri = getImagePath();
        return LinkUtil.getUrl(context.getRequest(), uri);
    }

    public String getImageUri() {
        return getImagePath();
    }

    public String getImagePath() {
        if (imagePath == null) {
            imagePath = getProperty("imagePath", "");
        }
        return imagePath;
    }
}
