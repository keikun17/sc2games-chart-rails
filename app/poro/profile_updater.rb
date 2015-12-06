class ProfileUpdater

  def self.update_all
    profiles = Profile.all
    profiles.each do |profile|
      find_and_update_from_bnet_params(profile.region, profile.profile_id, profile.r_id, profile.name)
    end
  end

  def self.update(profile, bnet_profile)
    profile.clan_tag = bnet_profile.clan_tag
    profile.primary_race = bnet_profile.career.primary_race

    profile.save if profile.changed?
  end

  def self.find_and_update_from_bnet_params(region, profile_id, r_id, name)
    puts "updating #{region}, #{profile_id}, #{r_id}, #{name}"
    bnet_player_object  = Bnet::Starcraft2::Profile.find(region: region, profile_id: profile_id, realm: r_id, name: name)

    if bnet_player_object
      puts "bnet object found"
      @profile = Profile.find_or_create_by(name: name, region: region, r_id: r_id, profile_id: profile_id)
      MatchUpdater.update(@profile, bnet_player_object.matches)
      ProfileUpdater.update(@profile, bnet_player_object)
      @profile.reload
    end

    @profile
  end

end
