import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shared--loaded"
export default class extends Controller {
  connect() {
    console.log(this.element.id);
    var ldld = new ldLoader({root: this.element.id})
    
  }
}
