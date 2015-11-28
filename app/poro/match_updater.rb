class MatchUpdater
  def self.update(profile, bnet_matches)
    # dates = {}
    #
    # (1.year.ago.beginning_of_day.to_datetime.to_i .. Time.now.beginning_of_day.to_datetime.to_i).step(1.day) do |date|
    #   date = Time.at(date).strftime("%Y-%m-%d")
    #   dates[date] = []
    # end


    bnet_matches.each do |bnet_match|
      if !profile.matches.find_by(ms_date: bnet_match.date)
        match = profile.matches.create(
          ms_date: bnet_match.date,
          map: bnet_match.map,
          decision: bnet_match.decision,
          game_type: bnet_match.raw_attributes["type"]
        )

        match.save
        # match_date = Time.at(match.date).strftime('%F')
      end

    end
  end
end

