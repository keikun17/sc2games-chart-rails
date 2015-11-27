class CreatePlayersTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :profile_id
      t.index :profile_id

      t.string :region
      t.string :name
      t.string :clan_tag
      t.string :primary_race
      t.json :portrait
      t.timestamps
    end
  end
end
