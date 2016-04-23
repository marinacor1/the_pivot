class CodersController < ApplicationController
  def index
    @coders = Coder.where(active: true)
  end

  def show
    @coder = Coder.find(params[:id])
  end
end
