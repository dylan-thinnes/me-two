//= require_tree .
window.addEventListener("load", function () {
    linkEls = document.getElementsByTagName("a");
    links = [];
    for (var ii = 0; ii < linkEls.length; ii++) links[ii] = linkEls[ii];
    links.filter(referencesLocal).map(bindHandler);
});

/* Link event binding code. */
// Check if an <a> node references a local path
referencesLocal = function (a) {
    // Use getAttribute instead of .href since .href coerces to full url
    url = a.getAttribute("href");
    
    // If the link is a dummy, ignore it
    if (url == undefined) return false;

    // If the link has a URI scheme, consider it non-local
    hasScheme = (/^\w+:\/\//).test(url)
    return !hasScheme;
}

prevDefaultCallback = function (e) { e.preventDefault(); }
// Binds a URI handler and calls preventDefault
bindHandler = function (a) {
    a.addEventListener("click", prevDefaultCallback);
}

/* URL getting and replacement */
