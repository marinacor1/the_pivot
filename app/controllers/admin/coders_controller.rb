class Admin::CodersController < Admin::BaseController
  def index
    @coders = Coder.all
  end

  def edit
    @coder = Coder.find(params[:id])
  end

  def update
    @coder = Coder.find(params[:id])
    if @coder.update(coder_params)
      flash[:message] = "Coder successfully updated!"
      redirect_to @coder
    else
      render :edit
    end
  end

  private
  def coder_params
    params.require(:coder).permit(:name, :experience, :category_id, :image_url, :cost)
  end
end
