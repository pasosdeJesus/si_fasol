class ActivaUniciadaIds < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE msip_persona SET tdocumento_id=11 WHERE tdocumento_id IS NULL;
      ALTER TABLE msip_persona ADD CONSTRAINT 
        tipoynumdoc_unicos UNIQUE (tdocumento_id, numerodocumento);
    SQL
    change_column_null :msip_persona, :tdocumento_id, false
    change_column_null :msip_persona, :numerodocumento, false
    change_column_null :msip_persona, :nombres, false
    change_column_null :msip_persona, :apellidos, false
  end

  def down
    execute <<-SQL
      ALTER TABLE msip_persona DROP CONSTRAINT;
    SQL
    change_column_null :msip_persona, :tdocumento_id, true
    change_column_null :msip_persona, :numerodocumento, true
    change_column_null :msip_persona, :nombres, true
    change_column_null :msip_persona, :apellidos, true
  end
end
