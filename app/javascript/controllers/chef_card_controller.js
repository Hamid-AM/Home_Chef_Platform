import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    // Ajout de l'écouteur d'événement sur le clic
    this.element.addEventListener("click", this.redirect.bind(this));
  }

  redirect(event) {
    event.preventDefault();  // Empêche le comportement par défaut du clic
    console.log(`Redirection vers : ${this.urlValue}`);

    // Vérifie si l'URL existe et redirige
    if (this.urlValue) {
      window.location.href = this.urlValue;
    }
  }
}

