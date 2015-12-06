class AddRIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :r_id, :integer, default: 1
  end
end
