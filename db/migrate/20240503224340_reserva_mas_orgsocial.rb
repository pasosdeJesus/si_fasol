class ReservaMasOrgsocial < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      SELECT setval('msip_orgsocial_id_seq', 100000);
    SQL
  end
  def down
    execute <<-SQL
      SELECT setval('msip_orgsocial_id_seq', 10000);
    SQL
  end
end
