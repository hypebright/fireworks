import "../node_modules/fireworks-js/dist/index.umd.js";
import "../styles/main.scss";

Shiny.addCustomMessageHandler("fireworks-start", function(message) {
  let container;

  if (message.id == null) {
    container = document.createElement("div");
    container.classList.add("fireworks-overlay");
    // append container to document
    document.body.appendChild(container);
  } else {
    container = document.getElementById(message.id);
  }

  const fireworks = new Fireworks.default(container, message.options);
  fireworks.start();

  // make fireworks available outside of this function
  window.fireworks = fireworks;
});


Shiny.addCustomMessageHandler("fireworks-stop", function(message) {
  window.fireworks.stop();
  if (message.id == null) {
    document.body.removeChild(document.querySelector(".fireworks-overlay"));
  }
});
