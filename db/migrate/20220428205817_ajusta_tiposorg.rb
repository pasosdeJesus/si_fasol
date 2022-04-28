class AjustaTiposorg < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE sip_tipoorg SET nombre='GRUPO ARMADO' WHERE id=20;
      DELETE FROM sip_tipoorg WHERE id=1;
    SQL
  end
  def down
    execute <<-SQL
      INSERT INTO public.sip_tipoorg (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'ORGANIZACIÓN DE LA SOCIEDAD CIVIL (ACOMPAÑADA)', NULL, '2020-08-05', NULL, '2020-08-05 00:00:00', '2020-08-05 00:00:00');
    SQL
  end
end
