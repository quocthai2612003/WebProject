document.addEventListener("DOMContentLoaded", function() {
    // Load header
    var headerContainer = document.createElement('div');
    headerContainer.innerHTML = 'load';
    document.querySelector('header').appendChild(headerContainer);

    // Load footer
    var footerContainer = document.createElement('div');
    footerContainer.innerHTML = '<div><p>Footer được nạp từ JavaScript</p></div>';
    document.querySelector('footer').appendChild(footerContainer);
});
