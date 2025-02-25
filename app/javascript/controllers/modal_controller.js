import { Controller } from "@hotwired/stimulus"
import "flowbite"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element)
    this.modal.show()
  }

  hidden(){
    this.modal.hide()
  }
  disconnect(){
    this.modal.hide()
  }

  submitEnd(e){
    if (e.detail.success) {
      this.hidden()
    }
  }
}
