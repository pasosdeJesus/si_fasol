export default class AutocompletaAjaxEntidad {

  prefijo = "p"
  idDatalist = "i"
  claseEnvoltura = "c"

  constructor(
    prefijo = "caso_victima", 
    claseEnvoltura="nested-fields", 
    idDatalist="fuente-entidades" 
  ) {
    console.log("constructor AutocompletaAjaxEntidad")
    this.prefijo = prefijo
    console.log("AutocompletaAjaxEntidad prefijo=", this.prefijo)
    this.idDatalist = idDatalist
    console.log("idDatalist=", this.idDatalist)
    this.claseEnvoltura = claseEnvoltura
    console.log("claseEnvoltura=", this.claseEnvoltura)
    let url = window.puntomontaje + '/orgsociales.json'
    var aeEntidades = new window.AutocompletaAjaxExpreg(
      [ new RegExp("^" + this.prefijo + "_attributes_[0-9]*_entidad_nombre$") ],
      url,
      this.idDatalist,
      this.operarElegida
    )
    aeEntidades.iniciar()
  }


  // Elije una entidad en auto-completación
  operarElegida = (eorig, cadgrupo, id, otrosop) => {
    msip_arregla_puntomontaje(window)
    const cs = id.split(';')
    const idEntidad = cs[0]
    const divcp = eorig.target.closest('.' + 
      this.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubico ' +
        this.claseEnvoltura)
      return
    }
    const elemIdEntidad= divcp.parentElement
      .querySelector('.' + this.prefijo + '_entidad_id')
      .querySelector('input')
    if (elemIdEntidad == null) {
      window.alert('No se ubico .'+ this.prefijo + '_entidad_id')
      return
    }
    const elemNombreEntidad= divcp.parentElement
      .querySelector('.' + this.prefijo + '_entidad_nombre')
      .querySelector('input')
    if (elemNombreEntidad == null) {
      window.alert('No se ubico .' + this.prefijo + '_entidad_id')
      return
    }
    elemIdEntidad.value = id;
    elemNombreEntidad.value = cadgrupo.substr(0,cadgrupo.length-(id.length + 1));
  }

  static iniciar() {
    console.log("AutocompletaAjaxEntidad")
    let url = window.puntomontaje + '/orgsociales.json'
    var aeEntidades = new window.AutocompletaAjaxExpreg(
      [ /^caso_victima_attributes_[0-9]*_entidad_nombre$/],
      url,
      AutocompletaAjaxEntidad.idDatalist,
      AutocompletaAjaxEntidad.operarElegida
    )
    aeEntidades.iniciar()
  }

}



