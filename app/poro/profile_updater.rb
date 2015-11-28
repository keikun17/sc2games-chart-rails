class ProfileUpdater
  def self.update(profile, bnet_profile)
    profile.clan_tag = bnet_profile.clan_tag
    profile.primary_race = bnet_profile.career.primary_race

    profile.save if profile.changed?
  end
end
