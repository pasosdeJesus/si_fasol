class AmpliaActoConFecha < ActiveRecord::Migration[7.0]
  def up
    add_column :sivel2_gen_acto, :fecha, :date
    execute <<-SQL
      UPDATE sivel2_gen_acto SET fecha=caso.fecha FROM sivel2_gen_caso AS caso
        WHERE caso_id=caso.id;
    SQL
    change_column :sivel2_gen_acto, :fecha, :date, null: false
  end

  def down
    remove_column :sivel2_gen_acto, :fecha, :date
  end
end
