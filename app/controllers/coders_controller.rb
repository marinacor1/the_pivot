class CodersController < ApplicationController
  def index
    @coders = Coder.all
  end

  def show
    @coder = Coder.find(params[:id])
  end
end

