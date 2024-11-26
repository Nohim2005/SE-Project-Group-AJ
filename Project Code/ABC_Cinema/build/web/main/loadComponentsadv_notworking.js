document.addEventListener("DOMContentLoaded", function () {
    // Function to get the base URL of the project root
    function getBasePath() {
        // If `document.currentScript` is null, fallback to `window.location.href`
        let scriptPath = document.currentScript ? document.currentScript.src : window.location.href;
        
        // Remove the last part (script filename) to get the base path
        let pathParts = scriptPath.split("/");
        pathParts.pop(); // Remove the last part (the script filename)
        
        return pathParts.join("/"); // Join back to form the base path
    }

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
                const element = document.querySelector(elementSelector);
                if (element) {
                    element.innerHTML = data;
                } else {
                    console.error(`Element ${elementSelector} not found.`);
                }
            })
            .catch(error => console.error("Error loading HTML:", error));
    }

    // Get the base path of the current project root
    const basePath = getBasePath();

    // Load reusable components with dynamically adjusted paths
    loadHTML(`${basePath}/main/components/header.html`, 'header');  // Path relative to project root
    loadHTML(`${basePath}/main/components/footer.html`, 'footer');  // Path relative to project root
    loadHTML(`${basePath}/main/components/scripts.html`, '#scripts-container');  // Path relative to project root
    loadHTML(`${basePath}/main/components/head.html`, 'head');  // Path relative to project root
});
