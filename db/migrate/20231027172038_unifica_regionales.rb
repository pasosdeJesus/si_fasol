class UnificaRegionales < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      DELETE FROM regionpago WHERE id=7;
      UPDATE msip_persona SET ultima_regionpago_id=12 WHERE ultima_regionpago_id=2; -- Mezcla ARMENIA en EJE CAFETERO
      DELETE FROM regionpago WHERE id=2; -- ARMENIA
      DELETE FROM regionpago WHERE id=7; -- CARTAGENA
      UPDATE msip_persona SET ultima_regionpago_id=12 WHERE ultima_regionpago_id=13; -- Mezcla EJE CAFETERO - RISARALDA en EJE CAFETERO
      DELETE FROM regionpago WHERE id=14; --EJE CAFETERO - CALDAS
      DELETE FROM regionpago WHERE id=16; --EJE CAFETERO - CHOCO
      DELETE FROM regionpago WHERE id=17; --EJE CAFETERO - QUINDIO
      DELETE FROM regionpago WHERE id=13; --EJE CAFETERO - RISARALDA
      UPDATE msip_persona SET ultima_regionpago_id=15 WHERE ultima_regionpago_id=21; -- Mezcla MEDELLIN ANTIOQUIA en ANTIOQUIA
      DELETE FROM regionpago WHERE id=21; --MEDELLIN ANTIOQUIA
      DELETE FROM regionpago WHERE id=22; --MEDELLIN ANTIOQUIA-RISARALDA
      UPDATE msip_persona SET ultima_regionpago_id=22 WHERE ultima_regionpago_id=21; -- Mezcla MEDELLIN ANTIOQUIA - RISARALDA en ANTIOQUIA
      UPDATE regionpago SET nombre='NORTE DE SANTANDER' WHERE id=23;
      UPDATE msip_persona SET ultima_regionpago_id=32 WHERE ultima_regionpago_id=24; -- Mezcla PACIFICO en VALLE DEL CAUCA
      DELETE FROM regionpago WHERE id=24; --PACIFICO
      DELETE FROM regionpago WHERE id=25; --PASTO NARIÑO
      DELETE FROM regionpago WHERE id=26; --POPAYAN
      DELETE FROM regionpago WHERE id=28; --RIOHACHA GUAJIRA
      UPDATE regionpago SET nombre='SANTANDER' WHERE id=29;
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
