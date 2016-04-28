class TeamsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @coders = Coder.find(@team.contents.keys)
  end

  def create
    coder = Coder.find(params[:coder_id])
    flash[:notice] = "Coder has already been added" if @team.contents.keys.include?(coder.id.to_s)
    @team.add_coder(coder.id)
    session[:team] = @team.contents
    redirect_to coders_path
  end

  def destroy
    @team.remove_coder(params[:id])
    session[:team] = @team.contents
    coder = Coder.find(params[:id])
    flash[:message] =  "Successfully removed #{ActionController::Base.helpers.link_to coder.name, coder_path(coder.id)} from your team.".html_safe
    redirect_to teams_path
  end
end
