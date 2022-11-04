import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["inicializa"]

  connect() {
    console.log('inicializa connect')
    $('.chosen-select').chosen()


    console.log('Paquetes inicializados')

    let esperarRecursosSprocketsYDocumento = function (resolver) {
      if (typeof window.sip_arregla_puntomontaje == 'undefined') {
        setTimeout(esperarRecursosSprocketsYDocumento, 100, resolver)
        return false
      }
      if (document.readyState !== 'complete') {
        setTimeout(esperarRecursosSprocketsYDocumento, 100, resolver)
        return false
      }
      resolver("Recursos manejados con sprockets cargados y documento presentado en navegador")
      return true
    }

    let promesaRecursosSprocketsYDocumento = new Promise((resolver, rechazar) => {
      esperarRecursosSprocketsYDocumento(resolver)
    })


    promesaRecursosSprocketsYDocumento.then((mensaje) => {
      console.log(mensaje)
      var root = window;

      sip_prepara_eventos_comunes(root, null, false);
      heb412_gen_prepara_eventos_comunes(root);
      mr519_gen_prepara_eventos_comunes(root);
      sivel2_gen_prepara_eventos_comunes(root);
      cor1440_gen_prepara_eventos_comunes(root);
      sivel2_gen_prepara_eventos_unicos(root);

      var p = new URL(document.URL).pathname.split('/')
      var p2ult = ''
      if (p.length>2) { 
        p2ult = p[p.length - 2] + "/" + p[p.length - 1]
      }
      console.log("p2ult=" + p2ult)
      if (p2ult == 'graficar/actos_individuales') {
        plotly_serietiempo_actos() 
      }

      sip_ejecutarAlCargarPagina(window)

    })

  }

}
