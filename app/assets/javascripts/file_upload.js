$(function() {
    // force cross domain issue on sub domain
    document.domain = document.domain.split(".").slice(1).join(".");
});
