document.addEventListener("turbo:load", function () {
  const element = document.querySelector("#open-popup");
  if (element) {
    // Your JavaScript code for the recipes show page goes here
    const openPopupButton = document.getElementById("open-popup");
    const recipePopup = document.getElementById("recipe-popup");

    openPopupButton.addEventListener("click", function (event) {
      event.preventDefault(); // Prevent the default action of the link

      const frame = document.getElementById("recipe-popup");
      frame.src = openPopupButton.href;
      recipePopup.classList.remove("hidden");
    });

    const closePopupButton = document.getElementById("close-popup");

    closePopupButton.addEventListener("click", function () {
      recipePopup.classList.add("hidden");
    });
  }
});
