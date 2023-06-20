class CreaFuncionEntidadessup < ActiveRecord::Migration[7.0]
  def up
    # Esta funcion retorna conjunto de ids de superiores jerarquicos de una 
    # entidad junto con la entidad
    execute <<-SQL
      CREATE OR REPLACE FUNCTION public.entidadessup(entidad_id NUMERIC) 
        RETURNS SETOF NUMERIC
        LANGUAGE sql
      AS $$
        WITH RECURSIVE supjer AS (
          SELECT o1.id, g1.nombre, o1.subde_id 
            FROM msip_orgsocial AS o1 
            JOIN msip_grupoper AS g1 ON g1.id=o1.grupoper_id 
            WHERE o1.id=entidad_id
          UNION SELECT o2.id, g2.nombre, o2.subde_id
            FROM msip_orgsocial AS o2 
            JOIN msip_grupoper AS g2 ON g2.id=o2.grupoper_id 
            INNER JOIN supjer AS s ON s.subde_id=o2.id) 
          SELECT id FROM supjer;
      $$;
    SQL
  end
  def down
    execute <<-SQL
      DROP FUNCTION public.entidadessup;
    SQL
  end
end
