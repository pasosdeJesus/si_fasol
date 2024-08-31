/* eslint no-console:0 */

console.log('Hola Mundo desde ESM')

import Rails from "@rails/ujs";
if (typeof window.Rails == 'undefined') {
  Rails.start();
  window.Rails = Rails;
}
import {Turbo} from "@hotwired/turbo-rails";
// no hacer "Turbo.session.drive = false " porque dejan de operar
// operaciones con turbo como añadir familiar

import './jquery'
import '../../vendor/assets/javascripts/jquery-ui.js'

import 'popper.js'              // Dialogos emergentes usados por bootstrap
import * as bootstrap from 'bootstrap'              // Maquetacion y elementos de diseño

import Msip__Motor from './controllers/msip/motor.js'
window.Msip__Motor = Msip__Motor

import TomSelect from 'tom-select';
window.TomSelect = TomSelect
window.configuracionTomSelect = {
  create: false,
  diacritics: true, //no sensitivo a acentos --falla que muestra error
  sortField: {
    field: "text",
    direction: "asc"
  }
}

// Apexcharts
import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts
import apexes from 'apexcharts/dist/locales/es.json'
Apex.chart = {
  locales: [apexes],
  defaultLocale: 'es',
}

import 'gridstack'


// Leaflet
import L from 'leaflet';
import 'leaflet.markercluster';


L.Icon.Default.mergeOptions({
        iconUrl: "marker-icon.png",
        iconRetinaUrl: "marker-icon-2x.png",
        shadowUrl: "marker-shadow.png"
});

//import plotly_serietiempo_actos from './plotly_actos'

import {AutocompletaAjaxExpreg} from '@pasosdejesus/autocompleta_ajax'
window.AutocompletaAjaxExpreg = AutocompletaAjaxExpreg

import AutocompletaAjaxEntidad from './AutocompletaAjaxEntidad'
window.AutocompletaAjaxEntidad = AutocompletaAjaxEntidad

console.log('Paquetes inicializados')

let esperarRecursosSprocketsYDocumento = function (resolver) {
  if (typeof window.puntomontaje == 'undefined') {
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

  msip_prepara_eventos_comunes(root, null, false);
  heb412_gen_prepara_eventos_comunes(root);
  mr519_gen_prepara_eventos_comunes(root);
  sivel2_gen_prepara_eventos_comunes(root);
  cor1440_gen_prepara_eventos_comunes(root);
  sivel2_gen_prepara_eventos_unicos(root);

  Msip__Motor.ejecutarAlCargarDocumentoYRecursos()  

  var p = new URL(document.URL).pathname.split('/')
  var p2ult = ''
  if (p.length>2) { 
    p2ult = p[p.length - 2] + "/" + p[p.length - 1]
  }
  console.log("p2ult=" + p2ult)
  if (p2ult == 'graficar/actos_individuales') {
    //plotly_serietiempo_actos() 
  }

  document.querySelectorAll('.tom-select').forEach((el)=>{
    new TomSelect(el, window.configuracionTomSelect)
  })
  window.autocompletaVictimaEntidad = new AutocompletaAjaxEntidad(
    "caso_victima", "nested-fields", "fuente-entidades"
  )
  window.autocompletaVictimaEntidad = new AutocompletaAjaxEntidad(
    "persona_ultima", "grupo-entidad-persona", "fuente-entidades-persona"
  )


})

document.addEventListener('turbo:load', (e) => {
 /* Lo que debe ejecutarse cada vez que turbo cargue una página,
 * tener cuidado porque puede dispararse el evento turbo varias
 * veces consecutivas al cargar una página.
 */
  
  console.log('Escuchador turbo:render')

  msip_ejecutarAlCargarPagina(window) // Establece root.puntomontaje 
  Msip__Motor.ejecutarAlCargarPagina()
})

import "./controllers"

console.log('Fin de archivo application.js')
