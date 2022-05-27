import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["card", "accept", "status"]

  connect() {
    console.log(this.element)
    console.log(this.acceptTarget)
    console.log(this.cardTarget)
  }

  accept(event) {
    event.preventDefault()
    fetch(this.acceptTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }

  reject() {
    console.log(this.buttonTarget)
  }
}