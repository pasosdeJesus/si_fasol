class CreateHomonimo < ActiveRecord::Migration[7.0]
  def up
    create_table :msip_homonimo do |t|
      t.integer :persona1_id
      t.integer :persona2_id

      t.timestamps
    end
    add_foreign_key :msip_homonimo, :msip_persona, column: :persona1_id
    add_foreign_key :msip_homonimo, :msip_persona, column: :persona2_id
    add_index "msip_homonimo", ["persona1_id", "persona2_id"],
      name: "sinrepetidos", unique: true
    execute <<-SQL
      ALTER TABLE msip_homonimo ADD CONSTRAINT primera_menor
        CHECK (persona1_id < persona2_id);
    SQL
  end

  def down
    drop_table :homonimo
  end
end
