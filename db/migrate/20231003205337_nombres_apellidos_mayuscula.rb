class NombresApellidosMayuscula < ActiveRecord::Migration[7.0]

  def up
    execute <<-SQL
      UPDATE msip_persona SET nombres=UPPER(nombres);
      UPDATE msip_persona SET apellidos=UPPER(apellidos);

      UPDATE msip_persona SET nombres=regexp_replace(regexp_replace(regexp_replace(nombres, '\s\s+', ' '), '^\s', ''), '\s$', '');
      UPDATE msip_persona SET apellidos=regexp_replace(regexp_replace(regexp_replace(apellidos, '\s\s+', ' '), '^\s', ''), '\s$', '');
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
