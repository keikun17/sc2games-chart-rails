class PlayersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @players = Player.all

    render json: @players
  end

  def match_history
    @dates = []

    # @player  = Bnet::Starcraft2::Profile.find(region: 'us', profile_id: 2143215, name: 'PlayerOne')
    binding.pry
    @profile  = Bnet::Starcraft2::Profile.find(region: params[:region], profile_id: params[:profile_id], name: params[:name])
    if @profile
      Player.find_or_create_by(name: params[:name], region: params[:region], profile_id: params[:profile_id])
    end
    @matches =  @profile.matches

    @dates = {}
    (1.year.ago.beginning_of_day.to_datetime.to_i .. Time.now.beginning_of_day.to_datetime.to_i).step(1.day) do |date|
      date = Time.at(date).strftime("%Y-%m-%d")
      @dates[date] = []
    end

    @matches.each do |match|
      match_date = Time.at(match.date).strftime('%F')

      if !@dates[match_date].nil?
        # If match date is still within the year, add the match record
        @dates[match_date] << match
      end
    end

    render json: {player: @profile, matches: @dates}, callback: params['callback']
  end
end
