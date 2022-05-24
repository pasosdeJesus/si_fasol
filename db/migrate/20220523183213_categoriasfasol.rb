class Categoriasfasol < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id, 
        fechacreacion, created_at, updated_at) VALUES
        (50, 'SIN PRESUNTO RESPONSABLE', NULL, 
        '2022-05-23', '2022-05-23', '2022-05-23');

      INSERT INTO sivel2_gen_tviolencia (id, nombre, nomcorto, 
        fechacreacion, created_at, updated_at) VALUES
        ('N', 'NO VIOLENTA', 'NV', '2022-05-23', '2022-05-23', 
        '2022-05-23');
      INSERT INTO sivel2_gen_supracategoria (id, codigo, nombre, 
        id_tviolencia, fechacreacion, created_at, updated_at) VALUES
        (100, 1, 'NO VIOLENTA', 'N',
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1000, 'MUERTE POR ACCIDENTE LABORAL', 100,
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1001, 'MUERTE POR DESASTRE NATURAL',100,
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1002, 'MUERTE POR ENFERMEDAD',100,
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1003, 'MUERTE NATURAL',100,
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1004, 'SUICIDIO',100,
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1010, 'LESIÓN POR ACCIDENTE DE TRABAJO', 100,
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1020, 'TRAMITE DE PENSIÓN',100,
        '2022-05-23', '2022-05-23', '2022-05-23');
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id,
        fechacreacion, created_at, updated_at) VALUES
        (1021, 'CRISIS ECONÓMICA', 100,
        '2022-05-23', '2022-05-23', '2022-05-23');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_categoria WHERE id>='1000' AND id<='1021';
      DELETE FROM sivel2_gen_supracategoria WHERE id='100';
      DELETE FROM sivel2_gen_tviolencia WHERE id='N';
      DELETE FROM sivel2_gen_presponsable WHERE id=50;
    SQL
  end
end
