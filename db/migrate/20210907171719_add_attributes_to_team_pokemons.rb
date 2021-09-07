class AddAttributesToTeamPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :team_pokemons, :current_status, :integer
    add_column :team_pokemons, :current_hp, :integer
  end
end
