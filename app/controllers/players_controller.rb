class PlayersController < ApplicationController
  def match_history
    @player  = Bnet::Starcraft2::Profile.find(region: 'us', profile_id: 2143215, name: 'PlayerOne')
    @matches =  @player.matches

    render json: @matches
  end
end
