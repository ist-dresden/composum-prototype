package content.prototype.composum.assets.tools

import com.composum.assets.commons.service.AdaptiveImageService

getService(AdaptiveImageService).dropRenditions(
        '/content/prototype/composum/assets',
        'wide', 'small'
)

getService(AdaptiveImageService).dropRenditions(
        '/content/prototype/composum/assets',
        'square', null
)

getService(AdaptiveImageService).dropRenditions(
        '/content/prototype/composum/assets',
        null, 'large'
)
