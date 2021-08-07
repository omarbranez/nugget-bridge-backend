class CreateNatures < ActiveRecord::Migration[6.1]
  def change
    create_table :natures do |t|
      t.string :name
      t.string :likes_flavor
      t.string :hates_flavor
      t.string :increased_stat
      t.string :decreased_stat

      t.timestamps
    end
  end
end
