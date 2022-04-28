class TemaPredeterminado < ActiveRecord::Migration[7.0]

def up
    execute <<-SQL
      UPDATE sip_tema SET
        nombre='PREDETERMINADO FASOL',
        fondo = '#f2f2f2',
        color_fuente = '#000000',
        nav_ini = '#038c33',
        nav_fin = '#03a63c',
        nav_fuente = '#f2f2f2',
        fondo_lista = '#8c8c8c',
        color_flota_subitem_fuente = '#f2f2f2',
        color_flota_subitem_fondo = '#038c33',
        btn_primario_fondo_ini = '#03a63c',
        btn_primario_fondo_fin = '#03a63c',
        btn_primario_fuente = '#f2f2f2',
        btn_peligro_fondo_ini = '#a62424',
        btn_peligro_fondo_fin = '#a62424',
        btn_peligro_fuente = '#f2f2f2',
        btn_accion_fondo_ini = '#8c8c8c',
        btn_accion_fondo_fin= '#8c8c8c',
        btn_accion_fuente = '#f2f2f2',
        alerta_exito_fondo = '#03a63c',
        alerta_exito_fuente = '#f2f2f2',
        alerta_problema_fondo = '#f8d7da',
        alerta_problema_fuente = '#721c24'
      WHERE id=1;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sip_tema SET
        nombre='AZUL POR OMISIÓN',
        fondo = '#ffffff',
        color_fuente = '#000000',
        nav_ini = '#95c4ff',
        nav_fin = '#266dd3',
        nav_fuente = '#ffffff',
        fondo_lista = '#95c4ff',
        color_flota_subitem_fuente = '#ffffff',
        color_flota_subitem_fondo = '#266dd3',
        btn_primario_fondo_ini = '#0088cc',
        btn_primario_fondo_fin = '#0044cc',
        btn_primario_fuente = '#ffffff',
        btn_peligro_fondo_ini = '#ee5f5b',
        btn_peligro_fondo_fin = '#bd362f',
        btn_peligro_fuente = '#ffffff',
        btn_accion_fondo_ini = '#ffffff',
        btn_accion_fondo_fin= '#e6e6e6',
        btn_accion_fuente = '#000000',
        alerta_exito_fondo = '#dff0d8',
        alerta_exito_fuente = '#468847',
        alerta_problema_fondo = '#f8d7da',
        alerta_problema_fuente = '#721c24'
      WHERE id=1;
    SQL
  end

end
