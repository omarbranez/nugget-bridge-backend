class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :flavor_text
      t.string :effect

      t.timestamps
    end
  end
end
