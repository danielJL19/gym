import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo"
export default class extends Controller {
  connect() {
    this.element.setAttribute('data-action', "click->turbo#click")
  }

  click(e){
    e.preventDefault();
    //obtenemos la url de ese link
    this.url = this.element.getAttribute('href')
    //hacemos una peticion via fetch y que nos responda mediante un turbo_stream
    fetch(this.url,{
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(r => r.text())
    .then(html => Turbo.renderStreamMessage(html))
    
  }
}
