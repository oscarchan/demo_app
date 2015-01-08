$(function() {
    // force cross domain issue on sub domain
    document.domain = document.domain.split(".").slice(1).join(".");

    // ie8 hack
    if (typeof console === "undefined" || typeof console.log === "undefined") {
        console = {};
        console.log = function() {};
    }
});
