class Admin::ContractsController < Admin::BaseController
  def show
    @contract = Contract.find(params[:id])
  end
end
