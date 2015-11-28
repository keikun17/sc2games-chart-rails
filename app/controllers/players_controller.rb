class PlayersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @profiles = Profile.all

    render json: @profiles
  end

  def match_history
    @dates = []
    bnet_player_object  = Bnet::Starcraft2::Profile.find(region: params[:region], profile_id: params[:profile_id], name: params[:name])

    if bnet_player_object
      @profile = Profile.find_or_create_by(name: params[:name], region: params[:region], profile_id: params[:profile_id])
      MatchUpdater.update(@profile, bnet_player_object.matches)
      render json: {profile: @profile, matches: @profile.matches}, callback: params['callback']
    else
      render json: {error: "Profile not found"}
    end

  end

  private

end
