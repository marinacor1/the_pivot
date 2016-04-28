class Admin::ContractsController < Admin::BaseController
  def show
    @contract = Contract.find(params[:id])
  end

  def index
    @contracts = Contract.all
  end
end
