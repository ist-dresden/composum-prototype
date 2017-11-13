package com.composum.prototype.pages.model.search;

import com.composum.pages.commons.model.Element;
import com.composum.platform.models.annotations.Property;
import com.composum.sling.core.BeanContext;
import com.composum.sling.core.util.LinkUtil;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.injectorspecific.Self;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URISyntaxException;

import static org.apache.commons.lang3.StringUtils.isNotBlank;
import static org.apache.sling.models.annotations.DefaultInjectionStrategy.OPTIONAL;

/**
 * Models the possible configurations for a search field; realized with Sling-Models.
 */
@Model(adaptables = BeanContext.class)
public class SlingModelsSearchField extends Element {

    private static final Logger LOG = LoggerFactory.getLogger(SlingModelsSearchField.class);

    public SlingModelsSearchField() {
        LOG.debug("init");
    }

    @Override
    public void initialize(BeanContext context, Resource resource) {
        super.initialize(context, resource);
    }

    @Self
    private FieldConfig config;

    /** Simple configurations. */
    public FieldConfig getConfig() {
        return config;
    }

    /**
     * Interface automatically instantiated by Sling-Models that contains all simple properties.
     * <p>
     * This design pattern enables saving code (field + getter) for simple attributes, but might hinder change later,
     * since it's not quite easy to move these into the containing class. It's important that this is an inner
     * interface, otherwise the {@link com.composum.platform.models.annotations.PropertyDefaults} of {@link
     * com.composum.pages.commons.model.AbstractModel} have to be replicated.
     */
    @Model(adaptables = {BeanContext.class}, defaultInjectionStrategy = OPTIONAL)
    public interface FieldConfig {
        @Property
        String getButtonText();

        @Property
        String getButtonSymbol();

        @Property
        String getButtonImage();

        @Property
        String getHint();

        @Property
        String getPlaceholderText();

        @Property
        String getSearchResultPath();

        @Property
        String getSearchResultAnchor();
    }


    /**
     * Constructs the URL for the search result page from {@link FieldConfig#getSearchResultPath()} and {@link
     * FieldConfig#getSearchResultAnchor()}.
     */
    public String getSearchResultLink() throws URISyntaxException {
        StringBuilder buf = new StringBuilder();
        String value;
        if (isNotBlank(value = config.getSearchResultPath())) {
            buf.append(LinkUtil.getUrl(context.getRequest(), value));
        }
        if (isNotBlank(value = config.getSearchResultAnchor())) {
            buf.append("#").append(value);
        }
        return buf.toString();
    }

}
