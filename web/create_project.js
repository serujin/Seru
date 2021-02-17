const showButton = document.getElementById("create_project_btn");

window.onclick = function(event) {
    if (event.target == showButton) {
        projectInfo.style.display = "block";
    } else {
        projectInfo.style.display = "none";
    }
}