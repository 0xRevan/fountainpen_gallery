class PensController < ApplicationController
  include Pagy::Backend

  allow_unauthenticated_access only: %i[index show]
  before_action :set_pen, only: %i[show edit update destroy]

  def index
    pens = Pen.recent.with_attached_image.search(params[:query])
    @pagy, @pens = pagy(pens, limit: 12)
  end

  def show
  end

  def new
    @pen = Pen.new
  end

  def edit
  end

  def create
    @pen = Pen.new(pen_params)

    if @pen.save
      redirect_to @pen, notice: "Pen was successfully added to the collection."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pen.update(pen_params)
      redirect_to @pen, notice: "Pen was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pen.destroy!
    redirect_to pens_url, notice: "Pen was successfully removed."
  end

  private

  def set_pen
    @pen = Pen.find(params[:id])
  end

  def pen_params
    params.require(:pen).permit(:title, :description, :price, :image)
  end
end
