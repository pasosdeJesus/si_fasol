class AgregPfPoromision < ActiveRecord::Migration[7.0]
  POROMISION=[
    10, # Actividades comunes
    11 # La justicia tiene corazón
  ]
  def up
    POROMISION.each do |idpf|
      pac = Cor1440Gen::Proyectofinanciero.find(idpf) # Actividades comunes
      pac.poromision=true
      pac.save!
    end
  end

  def down
    POROMISION.each do |idpf|
      pac = Cor1440Gen::Proyectofinanciero.find(idpf) # Actividades comunes
      pac.poromision=false
      pac.save!
    end
  end
end
