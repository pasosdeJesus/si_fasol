export default class AutocompletaAjaxEntidad {


  // Elije una entidad en auto-completación
  static operarElegida (eorig, cadgrupo, id, otrosop) {
    msip_arregla_puntomontaje(window)
    const cs = id.split(';')
    const idEntidad = cs[0]
    const divcp = eorig.target.closest('.' + 
      AutocompletaAjaxEntidad.claseEnvoltura)
    if (divcp == null) {
      window.alert('No se ubico ' +
        AutocompletaAjaxEntidad.claseEnvoltura)
      return
    }
    const elemIdEntidad= divcp.parentElement
      .querySelector('.caso_victima_entidad_id')
      .querySelector('input')
    if (elemIdEntidad == null) {
      window.alert('No se ubico .caso_victima_entidad_id')
      return
    }
    const elemNombreEntidad= divcp.parentElement
      .querySelector('.caso_victima_entidad_nombre')
      .querySelector('input')
    if (elemNombreEntidad == null) {
      window.alert('No se ubico .caso_victima_entidad_id')
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


AutocompletaAjaxEntidad.claseEnvoltura = 'nested-fields';
AutocompletaAjaxEntidad.idDatalist = 'fuente-entidades';
