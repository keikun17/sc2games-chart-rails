class CreateMatchesTable < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :profile
      t.integer :ms_date
      t.index :ms_date
      t.string :map
      t.string :decision           # Win / Loss / Draw
      t.index :decision
      t.string :game_type               # Fours / Twos / Custom
      t.index :game_type

      t.timestamps
    end
  end
end
