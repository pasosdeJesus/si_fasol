import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ 'grupo' ]

  connect() {
    console.log('Conectado un usuario_con_grupo_controller')
  }

  cambiar_grupo(event) {
    if (event.target.value == '' || 
      typeof(window.cor1440_usuario_con_grupo_tabla) != 'object' || 
      typeof(window.cor1440_usuario_con_grupo_tabla[+event.target.value]) != 'string') {
      this.grupoTarget.innerText = ''
    } else {
      this.grupoTarget.innerText = 
        window.cor1440_usuario_con_grupo_tabla[+event.target.value]
    }
  }
}
