class InksController < ApplicationController
  include Pagy::Backend

  allow_unauthenticated_access only: %i[index show]
  before_action :set_ink, only: %i[show edit update destroy]

  def index
    inks = Ink.recent.with_attached_image.search(params[:query])
    @pagy, @inks = pagy(inks, limit: 12)
  end

  def show
  end

  def new
    @ink = Ink.new
  end

  def edit
  end

  def create
    @ink = Ink.new(ink_params)

    if @ink.save
      redirect_to @ink, notice: "Ink was successfully added to the collection."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ink.update(ink_params)
      redirect_to @ink, notice: "Ink was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ink.destroy!
    redirect_to inks_url, notice: "Ink was successfully removed."
  end

  private

  def set_ink
    @ink = Ink.find(params[:id])
  end

  def ink_params
    params.require(:ink).permit(:name, :brand, :color, :description, :price, :image)
  end
end
