import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: "pk.eyJ1IjoiYnV5dGhlYnVsayIsImEiOiJjbDNsZmxhczIwOGswM2NvMTk4MTN0eXNuIn0.uw7U3VtlD9Ope-mh_iCMCQ",
      types: "country, region, place, postcode, locality, neighborhood, address"
    });
    console.log("nice")

    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
