class RenombraPlantillaBeneficiarios < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      UPDATE heb412_gen_plantillahcm 
        SET nombremenu = 'Listado de población vinculada',
        ruta='plantillas/listado_poblacion_vinculada.ods'
        WHERE id=102;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE heb412_gen_plantillahcm 
        SET nombremenu = 'Listado de beneficiarios',
        ruta='plantillas/listado_beneficiarios.ods'
        WHERE id=102;
    SQL
  end

end
