class PlayersController < ApplicationController
  def match_history
    @dates = []

    # @player  = Bnet::Starcraft2::Profile.find(region: 'us', profile_id: 2143215, name: 'PlayerOne')
    @player  = Bnet::Starcraft2::Profile.find(region: params[:region], profile_id: params[:profile_id], name: params[:name])
    @matches =  @player.matches

    @matches.each do |match|
      match.date = Time.at(match.date).strftime('%F')
    end

    render json: @matches
  end
end
