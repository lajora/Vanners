import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Rent a van, travel the world!"],
      typeSpeed: 50,
      loop: false
    });
  }
}
