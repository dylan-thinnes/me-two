mockNode=function(e){links=e.getElementsByTagName("a"),mockCollection(links)},mockCollection=function(e){links=[];for(var t=0;t<e.length;t++)links[t]=e[t];links.filter(referencesLocal).map(mockLink)},mockLink=function(e){e.addEventListener("click",prevDefaultCallback),e.addEventListener("click",navigateTo.bind(window,e.href)),e.setAttribute("data-mocked","true")},prevDefaultCallback=function(e){e.preventDefault()},referencesLocal=function(e){return url=e.getAttribute("href"),url!=undefined&&("true"!=e.getAttribute("data-disable-mocking")&&("true"!=e.getAttribute("data-mocked")&&(hasScheme=/^\w+:\/\//.test(url),!hasScheme)))},navigateTo=function(e){history.pushState({},"",e),onNavigate()},onNavigate=function(){showCurrentPage()},window.onpopstate=onNavigate,showCurrentPage=function(){var n=window.location.pathname;if("/"===n)return document.getElementById("profile").style.backgroundImage="url(/assets/profile-5c66ac55acce557f470ebbc2bf931690d0b0c011eb9cd1d214ad6f7ffc7ac90b.jpg)",void setTimeout(function(){document.body.classList.remove("open"),setTitleFromSection()},20);if((e=findSection(n))==undefined)console.log("section does not exist",n),clearSelection(),document.body.classList.add("open"),getContent(n,function(e){var t=createSection(n,e);setTitleFromSection(t),setTimeout(selectSection.bind(window,n),100)});else{var e=selectSection(n);setTitleFromSection(e),document.body.classList.add("open")}},setTitleFromSection=function(e){if(e==undefined)return document.title="Dylan Thinnes";var t=e.getElementsByTagName("title")[0];return t==undefined?document.title="Dylan Thinnes":document.title=t.innerHTML},getContent=function(e,t){var n=new XMLHttpRequest;n.onreadystatechange=function(){4==n.readyState&&t(n.response)},n.open("GET",e+"?nolayout=true"),n.send()},findSection=function(e){for(var t=document.getElementsByClassName("section"),n=0;n<t.length;n++){var o=t[n];if(o.getAttribute("data-url")==e)return o}},createSection=function(e,t){var n=document.createElement("div");n.classList.add("section"),n.innerHTML=t,n.setAttribute("data-url",e);var o=document.getElementById("loading");return document.getElementById("content").insertBefore(n,o),mockNode(n),n},selectSection=function(e){return clearSelection(),section=findSection(e),section.classList.add("selected"),section},clearSelection=function(){for(var e=document.getElementsByClassName("section"),t=0;t<e.length;t++)e[t].classList.remove("selected")},mockNode(document),console.log("Nodes mocked.");