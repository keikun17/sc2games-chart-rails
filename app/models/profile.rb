class Profile < ActiveRecord::Base

  validates :profile_id, presence: true, uniqueness: true
  validates :region, presence: true
  validates :name, presence: true

  has_many :matches

end

# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  profile_id   :string
#  region       :string
#  name         :string
#  clan_tag     :string
#  primary_race :string
#  portrait     :json
#  created_at   :datetime
#  updated_at   :datetime
#
