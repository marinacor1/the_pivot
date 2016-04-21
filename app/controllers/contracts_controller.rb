class ContractsController < ApplicationController

  def create
    Contract.new(teammates_ids: session[:team].keys).save
    session[:team].clear
    redirect_to history_path
  end

  def show
    @contract = Contract.find(params[:id])
    
    @teammates = @contract.teammates_ids.map do |teammate_id|
      Coder.find( teammate_id)
    end
  end

  def index
    @contracts = Contract.all
  end

  private



end
