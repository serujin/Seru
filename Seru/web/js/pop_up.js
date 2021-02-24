const popUp = document.getElementById("pop-up");
const btn = document.getElementById("show_pop-up");
const span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
  popUp.style.display = "block";
};

span.onclick = function() {
  popUp.style.display = "none";
};

window.onclick = function(event) {
  if (event.target === popUp) {
    popUp.style.display = "none";
  }  
};