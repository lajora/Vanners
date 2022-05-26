import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button","cards", "map"]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  switchView() {
    if (this.buttonTarget.innerText == "Cards view") {
      this.buttonTarget.innerText = "Map view"
      this.cardsTarget.classList.remove("hidden")
      this.mapTarget.classList.add("hidden")
    } else {
      this.buttonTarget.innerText = "Cards view"
      this.cardsTarget.classList.add("hidden")
      this.mapTarget.classList.remove("hidden")
    }
  }

}