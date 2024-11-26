class Renpr50 < ActiveRecord::Migration[7.2]
  def up
    execute <<-SQL
      INSERT INTO public.sivel2_gen_presponsable (id, nombre, papa_id, 
        fechacreacion, created_at, updated_at) VALUES
      (100, 'Sin Presunto Responsable d', NULL, 
      '2022-05-23', '2022-05-23', '2022-05-23');

      UPDATE public.sivel2_gen_caso_presponsable SET presponsable_id=100
        WHERE presponsable_id=50;
      UPDATE public.sivel2_gen_acto SET presponsable_id=100
        WHERE presponsable_id=50;
      UPDATE public.sivel2_gen_actocolectivo SET presponsable_id=100
        WHERE presponsable_id=50;

      DELETE FROM public.sivel2_gen_presponsable WHERE id=50;
      UPDATE public.sivel2_gen_presponsable SET 
        nombre='Sin Presunto Responsable' WHERE id=100;
    SQL
  end
  def down
    execute <<-SQL
      INSERT INTO public.sivel2_gen_presponsable (id, nombre, papa_id, 
        fechacreacion, created_at, updated_at) VALUES
      (50, 'Sin Presunto Responsable d', NULL, 
      '2022-05-23', '2022-05-23', '2022-05-23');

      UPDATE public.sivel2_gen_caso_presponsable SET presponsable_id=50
        WHERE presponsable_id=100;
      UPDATE public.sivel2_gen_acto SET presponsable_id=50
        WHERE presponsable_id=100;
      UPDATE public.sivel2_gen_actocolectivo SET presponsable_id=50
        WHERE presponsable_id=100;

      DELETE FROM public.sivel2_gen_presponsable WHERE id=100;
      UPDATE public.sivel2_gen_presponsable SET 
        nombre='Sin Presunto Responsable' WHERE id=50;

    SQL
  end
end
