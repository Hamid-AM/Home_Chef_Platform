import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    this.element.addEventListener("click", this.redirect.bind(this));
  }

  redirect() {
    event.preventDefault();
    console.log(`Redirection vers : ${this.urlValue}`);
    if (this.urlValue) {
      window.location.href = this.urlValue;
    }
  }
}
