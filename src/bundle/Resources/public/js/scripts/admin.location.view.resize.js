(function(global, doc) {
    if (!('ResizeObserver' in global)) {
        return;
    }

    const SMALL_SIZE_LIMIT = 900;
    const resizeObserver = new global.ResizeObserver((entries) => {
        entries.forEach((entry) => {
            const isSmallSize = entry.contentRect.width <= SMALL_SIZE_LIMIT;

            entry.target.classList.toggle('ez-small-container', isSmallSize);
        });
    });
    const locationViewContainer = doc.querySelector('.ez-location-view-container');

    resizeObserver.observe(locationViewContainer);
})(window, window.document);
