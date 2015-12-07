class AddRIdAndNameAndRegionIndexToProfiles < ActiveRecord::Migration
  def change
    add_index :profiles, :r_id
    add_index :profiles, :name
    add_index :profiles, :region
  end
end
