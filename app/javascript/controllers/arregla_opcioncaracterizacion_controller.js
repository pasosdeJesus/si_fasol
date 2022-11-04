import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ 'opcioncaracterizacion' ]

  connect() {
    console.log('Conectado un arregla_opcioncaracterizacion')
    document.querySelectorAll(".chosen-container[id$=opcioncaracterizacion_ids_chosen][style^='width: 0px']").forEach(
      (a) => a.setAttribute('style', 'width: 10em')
    )
  }

}
