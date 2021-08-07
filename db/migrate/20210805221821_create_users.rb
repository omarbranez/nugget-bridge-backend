class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :current_team
      t.integer :victories
      t.boolean :active, default: true 
      t.timestamps
    end
  end
end
