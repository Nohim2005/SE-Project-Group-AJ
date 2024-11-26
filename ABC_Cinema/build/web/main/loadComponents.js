document.addEventListener("DOMContentLoaded", function () {
    // Function to load external HTML into a specific element
    function loadHTML(url, elementSelector) {
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`Failed to load ${url}: ${response.statusText}`);
                }
                return response.text();
            })
            .then(data => {
                document.querySelector(elementSelector).innerHTML = data;
            })
            .catch(error => console.error("Error loading HTML:", error));
    }

    // Load reusable components
    loadHTML('../main/header.html', 'header'); // Path to header.html
    loadHTML('../main/footer.html', 'footer'); // Path to footer.html
    loadHTML('../main/scripts.html', '#scripts-container'); // Path to scripts.html
    loadHTML('../main/head.html', 'head'); // Path to head.html
});
