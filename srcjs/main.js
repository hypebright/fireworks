import "../node_modules/fireworks-js/dist/index.umd.js";
import "../styles/main.scss";

Shiny.addCustomMessageHandler("fireworks-start", function(message) {
  let container;

  if (message.id == null) {
    container = document.createElement("div");
    container.classList.add("fireworks-overlay", "fireworks-full-screen");
    // append container to document
    document.body.appendChild(container);
  } else {
    container = document.getElementById(message.id);
  }

  const fireworks = new Fireworks.default(container, message.options);

  // if fireworks are on id, add fireworks-overlay class to canvas tag
  if (message.id != null) {
    fireworks.canvas.classList.add("fireworks-overlay");
  }

  fireworks.start();

  // make fireworks available outside of this function
  window.fireworks = fireworks;
});


Shiny.addCustomMessageHandler("fireworks-stop", function(message) {
  window.fireworks.stop();
  if (message.id == null) {
    document.body.removeChild(document.querySelector(".fireworks-full-screen"));
  }
});
