class CodersController < ApplicationController
  def index
    @coders = Coder.all
  end
end
