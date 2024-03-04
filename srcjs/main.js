import "../node_modules/fireworks-js/dist/index.umd.js";
import "../styles/main.scss";

Shiny.addCustomMessageHandler("fireworks-start", function(message) {
  let container;
  let identifier;

  if (message.id == null) {
    container = document.createElement("div");
    container.classList.add("fireworks-overlay", "fireworks-full-screen");
    // append container to document
    document.body.appendChild(container);
    identifier = "full-screen";
  } else {
    container = document.getElementById(message.id);
    identifier = message.id;
  }

  const fireworks = new Fireworks.default(container, message.options);

  // if fireworks are on id, add fireworks-overlay class to canvas tag
  if (message.id != null) {
    fireworks.canvas.classList.add("fireworks-overlay");
  }

  fireworks.start();

  // make fireworks available outside of this function
  window[`fireworks-${identifier}`] = fireworks;
});

Shiny.addCustomMessageHandler("fireworks-stop", function(message) {
  const identifier = message.id == null ? "full-screen" : message.id;
  const currentOpts = window[`fireworks-${identifier}`].currentOptions;

  const stopFireworks = () => {
    window[`fireworks-${identifier}`].stop();
    if (message.id == null) {
      document.body.removeChild(
        document.querySelector(".fireworks-full-screen")
      );
    }
  };

  if (message.fadeOut) {
    window[`fireworks-${identifier}`].updateOptions({
      ...currentOpts,
      intensity: 1
    });
    // add 2000 ms delay to allow fireworks to fade out
    setTimeout(() => {
      stopFireworks();
    }, 2000);
  } else {
    stopFireworks();
  }
});

