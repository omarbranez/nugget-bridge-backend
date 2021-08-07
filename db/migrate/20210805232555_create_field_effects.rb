class CreateFieldEffects < ActiveRecord::Migration[6.1]
  def change
    create_table :field_effects do |t|
      t.string :name

      t.timestamps
    end
  end
end
