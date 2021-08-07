class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :pp
      t.integer :type_id
      t.integer :power
      t.integer :priority
      t.integer :effect_chance
      t.integer :accuracy
      t.string :flavor_text
      t.string :damage_type
      t.string :effect

      t.timestamps
    end
  end
end
