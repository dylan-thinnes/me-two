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
showCurrentPage = function () {
    var path = window.location.pathname;
    var section = findSection(path);
    if (section == undefined) {
        console.log("section does not exist", path)
        getContent(path, function (content) {
            createSection(path, content);
            setTimeout(selectSection.bind(window, path), 100);
        });
    } else {
        selectSection(path);
    }
}

/* URL getting and replacement */
// gets the content at the endpoint without the layout
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

/* Section Management */
// Sections contain the content for a given endpoint and have a data-url attr
// The page may be initialized with any number of sections

// Finds the section corresponding to a given url
findSection = function (url) {
    var sections = document.getElementsByClassName("section");
    for (var ii = 0; ii < sections.length; ii++) {
        var section = sections[ii];
        var sectionUrl = section.getAttribute("data-url");
        if (sectionUrl == url) return section;
    }
}

// create a section container for content retrieved from an endpoint
// append it to the page container
createSection = function (url, content) {
    var section = document.createElement("div");
    section.classList.add("section");
    section.innerHTML = content;
    section.setAttribute("data-url", url);

    document.getElementById("content").appendChild(section);

    return section;
}

// select a section, hide whatever section isn't
selectSection = function (url) {
    var sections = document.getElementsByClassName("section");
    for (var ii = 0; ii < sections.length; ii++) {
        sections[ii].classList.remove("selected");
    }
    findSection(url).classList.add("selected");
}
