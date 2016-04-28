class CodersController < ApplicationController
  def index
    @coders = Coder.active?
  end

  def show
    @coder = Coder.find(params[:id])
  end
end
