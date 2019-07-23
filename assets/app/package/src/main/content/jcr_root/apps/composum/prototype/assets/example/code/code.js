'use strict';
(function (window) {
    window.composum = window.composum || {};
    window.composum.assets = window.composum.assets || {};
    window.composum.assets.components = window.composum.assets.components || {};

    (function (components, assets, core) {

        components.const = _.extend(components.const || {}, {
            codeview: {
                cssBase: '.composum-prototype-assets-example-code'
            }
        });

        components.CodeView = Backbone.View.extend({

            initialize: function (options) {
                this.$code = this.$(components.const.codeview.cssBase + "_content code");
                this.$expand = this.$(components.const.codeview.cssBase + "_expand");
                this.$collapse = this.$(components.const.codeview.cssBase + "_collapse");
                this.highlight = hljs.highlightBlock(this.$code[0]);
                this.$expand.click(_.bind(this.expand, this));
                this.$collapse.click(_.bind(this.collapse, this));
            },

            expand: function () {
                this.$el.removeClass("collapsed");
                this.$el.addClass("expanded");
            },

            collapse: function () {
                this.$el.removeClass("expanded");
                this.$el.addClass("collapsed");
            }

        });

        $(document).ready(function () {
            $(components.const.codeview.cssBase).each(function () {
                core.getView(this, components.CodeView);
            });
        });

    })(window.composum.assets.components, window.composum.assets, window.core);
})(window);
