class Mascategoriasfasol < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1023, 'ACCIDENTE LABORAL', 100, --NV
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1024, 'ENFERMEDAD', 100, --NV
        '2022-05-23', '2022-05-23', '2022-05-23');


      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1030, 'EXILIO', 1, --DH PP
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1040, 'EXILIO', 2, --VPS PP
        '2022-05-23', '2022-05-23', '2022-05-23');

      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1050, 'DESPLAZAMIENTO FORZADO INDIVIDUAL', 1, --DH PP
        '2022-05-23', '2022-05-23', '2022-05-23');

      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1060, 'DESPLAZAMIENTO FORZADO INDIVIDUAL', 2, --VPS PP
        '2022-05-23', '2022-05-23', '2022-05-23');

      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1080, 'JUDICIALIZACIÓN ARBITRARIA', 2, --VPS PP
        '2022-05-23', '2022-05-23', '2022-05-23');

      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1070, 'ACOSO LABORAL', 1, --DH PP
        '2022-05-23', '2022-05-23', '2022-05-23');

    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_categoria 
        WHERE id IN (1023, 1024, 1030, 1040, 1050, 1060, 1070, 1080);
    SQL
  end
end
