class PensController < ApplicationController
  # hey, before we do anything with a specific pen
  # let's make sure we can find it! (avoid the awkward "pen not found" moments)
  before_action :set_pen, only: [ :show, :edit, :update, :destroy ]

  # GET /pens
  # this is our showcase - showing off all the pens we've got
  def index
    # grab all pens and their photos in one go
    @pens = Pen.all.with_attached_image
  end

  # GET /pens/1
  # when someone wants to see just one specific pen
  def show
  end

  # GET /pens/new
  # setting up a blank slate for a new pen
  def new
    @pen = Pen.new
  end

  # GET /pens/1/edit
  # getting ready to change pen details
  def edit
  end

  # POST /pens
  # alright, time to add a new pen to our collection!
  def create
    @pen = Pen.new(pen_params)

    if @pen.save
      redirect_to @pen, notice: "Sweet! New pen added to the collection!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pens/1
  # time to update our pen's details
  # like when you realize it's actually a fine nib, not medium
  def update
    if @pen.update(pen_params)
      # pen updated! let's go see how it looks
      redirect_to @pen, notice: "Pen details updated successfully!"
    else
      # something went wrong, let's try again
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pens/1
  # time to say goodbye to a pen
  def destroy
    @pen.destroy
    redirect_to pens_url, notice: "Pen has left the building!"
  end

  private

  # find a specific pen by its ID
  def set_pen
    @pen = Pen.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to pens_url, alert: "Hmm, cannot find that pen. Did it roll under the desk?"
  end

  # make sure we only accept the stuff we want
  def pen_params
    params.require(:pen).permit(:title, :description, :price, :image)
  end
end
