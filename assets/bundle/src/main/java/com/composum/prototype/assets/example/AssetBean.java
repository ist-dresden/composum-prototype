/*
 * copyright (c) 2015 IST GmbH Dresden, Germany
 *
 * This software may be modified and distributed under the terms of the MIT license.
 */
package com.composum.prototype.assets.example;

import com.composum.assets.commons.AssetsConstants;
import com.composum.assets.commons.config.AssetConfig;
import com.composum.assets.commons.handle.AssetMetaData;
import com.composum.assets.commons.handle.ImageAsset;
import com.composum.assets.commons.util.ImageUtil;
import com.composum.sling.core.AbstractSlingBean;
import com.composum.sling.core.BeanContext;
import com.composum.sling.core.ResourceHandle;
import com.composum.sling.core.util.LinkUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.sling.api.resource.Resource;

public class AssetBean extends AbstractSlingBean {

    public static final String ASSET_PATH = "assetPath";

    private transient ImageAsset asset;
    private transient AssetMetaData metaData;

    private transient String altText;

    private transient String variation;
    private transient String rendition;

    private transient String imageUri;

    public AssetBean(BeanContext context, Resource resource,
                     String variation, String rendition, AssetConfig config) {
        this(context, resource);
        this.variation = variation;
        this.rendition = rendition;
    }

    public AssetBean(BeanContext context, Resource resource) {
        super(context, resource);
    }

    public AssetBean() {
    }

    public String getImageUrl() {
        String uri = getImageUri();
        return LinkUtil.getUrl(context.getRequest(), uri);
    }

    public ImageAsset getAsset() {
        if (asset == null) {
            String path = getProperty(ASSET_PATH, "");
            if (StringUtils.isNotBlank(path)) {
                Resource assetResource = context.getResource().getResourceResolver().getResource(path);
                if (assetResource != null) {
                    asset = new ImageAsset(context, assetResource);
                }
            }
            if (asset == null) {
                asset = new ImageAsset(context, resource);
            }
        }
        return asset;
    }

    public AssetMetaData getMetaData() {
        if (metaData == null) {
            Resource metaResource = resource.getChild(AssetsConstants.PATH_META);
            metaData = new AssetMetaData(context, ResourceHandle.use(metaResource));
        }
        return metaData;
    }

    public String getAltText() {
        if (altText == null) {
            altText = getProperty("altText", "");
            if (StringUtils.isBlank(altText)) {
                altText = getMetaData().getAltText();
            }
        }
        return altText;
    }

    public String getVariation() {
        if (variation == null) {
            variation = getProperty(AssetsConstants.PROP_VARIATION, "");
        }
        return variation;
    }

    public String getRendition() {
        if (rendition == null) {
            rendition = getProperty(AssetsConstants.PROP_RENDITION, "");
        }
        return rendition;
    }

    public String getImageUri() {
        if (imageUri == null) {
            imageUri = getImageUri(getVariation(), getRendition());
        }
        return imageUri;
    }

    public String getImageUri(String variationKey, String renditionKey) {
        return ImageUtil.getImageUri(getAsset(), variationKey, renditionKey);
    }
}
