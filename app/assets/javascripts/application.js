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
    a.addEventListener("click", navigateTo.bind(window, a.href));
}

/* History state changers and handlers */
navigateTo = function (url) {
    history.pushState({}, "", url);
    onNavigate();
} 
onNavigate = function () {
    showCurrentPage();
}
window.onpopstate = onNavigate;

// Main entry point for a url change (popstate) event
// mediates between all associated content getting and embedding
showCurrentPage () {
    console.log("current page is", window.location.pathname);
}

/* URL getting and replacement */
getContent = function (url, callback) {
    var req = new XMLHttpRequest();
    req.onreadystatechange = function () {
        if (req.readyState == 4 && req.status == 200) {
            callback(req.response);
        }
    }
    req.open("GET", url + "?nolayout=true")
    req.send();
}

