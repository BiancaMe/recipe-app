// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("turbo:load", function () {
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
});
