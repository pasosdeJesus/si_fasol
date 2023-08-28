class CreateRegionpago < ActiveRecord::Migration[7.0]

  include Msip::SqlHelper

  def up
    create_table :regionpago do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps
    end
    cambiaCotejacion('regionpago', 'nombre', 500, 'es_co_utf_8')

    execute <<-SQL
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, 'SIN INFORMACIÓN', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, 'ARMENIA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        3, 'ATLÁNTICO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        4, 'BOGOTÁ', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        5, 'BOLIVAR', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        6, 'CAQUETA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        7, 'CARTAGENA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        8, 'CESAR', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        9, 'CÓRDOBA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        10, 'CUNDINAMARCA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        12, 'EJE CAFETERO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        13, 'EJE CAFETERO - RISARALDA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        14, 'EJE CAFETERO - CALDAS', '2020-08-05', '2020-08-05', '2020-08-05');

      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        15, 'ANTIOQUIA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        16, 'EJE CAFETERO - CHOCO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        17, 'EJE CAFETERO - QUINDÍO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        20, 'HUILA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        21, 'MEDELLIN ANTIOQUIA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        22, 'MEDELLIN ANTIOQUIA - RISARALDA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        23, 'NORTE DE SANTANDER Y ARAUCA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        24, 'PACIFICO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        25, 'PASTO NARIÑO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        26, 'POPAYAN', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        27, 'PUTUMAYO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        28, 'RIOHACHA GUAJIRA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        29, 'SANTANDER Y MAGDALENA MEDIO', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        30, 'SUCRE', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        31, 'TOLIMA', '2020-08-05', '2020-08-05', '2020-08-05');
      INSERT INTO regionpago (id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        32, 'VALLE DEL CAUCA', '2020-08-05', '2020-08-05', '2020-08-05');

      SELECT setval('regionpago_id_seq', 100);
    SQL
  end

  def down
    drop_table :regionpago
  end
end
