class CreateTipoaliado < ActiveRecord::Migration[7.1]
  include Msip::SqlHelper

  def up
    create_table :tipoaliado do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps
    end
    cambiaCotejacion('tipoaliado', 'nombre', 500, 'es_co_utf_8')
    execute <<-SQL
      INSERT INTO tipoaliado(id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        1, 'Sin información',
        '2024-04-08', '2024-04-08', '2024-04-08');
      INSERT INTO tipoaliado(id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        2, 'Académico',
        '2024-04-08', '2024-04-08', '2024-04-08');
      INSERT INTO tipoaliado(id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        3, 'ORP',
        '2024-04-08', '2024-04-08', '2024-04-08');
      INSERT INTO tipoaliado(id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        4, 'Sindical',
        '2024-04-08', '2024-04-08', '2024-04-08');
      INSERT INTO tipoaliado(id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        5, 'Funcionario institucional',
        '2024-04-08', '2024-04-08', '2024-04-08');
      INSERT INTO tipoaliado(id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        6, 'Proveedor',
        '2024-04-08', '2024-04-08', '2024-04-08');
      INSERT INTO tipoaliado(id, nombre, 
        fechacreacion, created_at, updated_at) VALUES (
        7, 'Donante externo',
        '2024-04-08', '2024-04-08', '2024-04-08');
        SELECT setval('tipoaliado_id_seq', 100);
    SQL
  end
  def down
    drop_table :tipoaliado
  end
end
