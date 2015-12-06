class PlayersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @profiles = Profile.all

    render json: @profiles
  end

  def match_history
    @profile = ProfileUpdater.find_and_update_from_bnet_params(params[:region], params[:profile_id], params[:r_id],  params[:name])

    if @profile.present?
      render json: {profile: @profile, matches: @profile.matches}, callback: params['callback']
    else
      render json: {error: "Profile not found"}
    end
  end
end
