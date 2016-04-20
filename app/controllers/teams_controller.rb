class TeamsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @coders = Coder.find(@team.contents.keys)
  end

  def create
    coder = Coder.find(params[:coder_id])
    @team.add_coder(coder.id)
    session[:team] = @team.contents
    redirect_to coders_path
  end

  def destroy
    @team.remove_coder(params[:id])
    session[:team] = @team.contents
    flash[:notice] =  "Successfully removed #{Coder.find(params[:id]).name} from your team."
    redirect_to teams_path
  end

end
