class Match < ActiveRecord::Base
end

# == Schema Information
#
# Table name: matches
#
#  id          :integer          not null, primary key
#  profiles_id :integer
#  ms_date     :integer
#  map         :string
#  decision    :string
#  type        :string
#  created_at  :datetime
#  updated_at  :datetime
#
