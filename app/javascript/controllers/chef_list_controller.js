import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["chefList", "openButton", "closeButton"]; // Les éléments contrôlés

  connect() {
    console.log("Chef list controller connected!");
  }

  showChefs() {
    this.chefListTarget.classList.add("show"); // Affiche les cards
    this.openButtonTarget.classList.add("d-none"); // Cache le bouton "Chef next your door"
    this.closeButtonTarget.classList.remove("d-none"); // Affiche le bouton "Close the door"
  }

  hideChefs() {
    this.chefListTarget.classList.remove("show"); // Cache les cards
    this.closeButtonTarget.classList.add("d-none"); // Cache le bouton "Close the door"
    this.openButtonTarget.classList.remove("d-none"); // Réaffiche le bouton "Chef next your door"
  }
}
