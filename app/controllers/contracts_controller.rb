class ContractsController < ApplicationController
  def create
    current_user.contracts.create(teammates_ids: session[:team].keys)
    session[:team].clear
    redirect_to history_path
  end

  def show
    if current_user
      @contract = Contract.find(params[:id])
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  def index
    if current_user
      @contracts = current_user.contracts.all
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end
end
