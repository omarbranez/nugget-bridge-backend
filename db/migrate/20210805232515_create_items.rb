class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :fling_effect
      t.integer :fling_power
      t.string :effect
      t.string :flavor_text

      t.timestamps
    end
  end
end
