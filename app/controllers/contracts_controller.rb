class ContractsController < ApplicationController

  def create
    Contract.new(teammates_ids: session[:team].keys).save
    session[:team].clear
    redirect_to history_path
  end

  def show
    if current_user
      @contract = Contract.find(params[:id])
      @teammates = @contract.teammates_ids.map do |teammate_id|
        Coder.find( teammate_id)
      end
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  def index
    if current_user
      @contracts = Contract.all
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  private



end
