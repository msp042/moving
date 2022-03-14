class BoxesController < ApplicationController
  before_action :current_user_must_be_box_user, only: [:edit, :update, :destroy] 

  before_action :set_box, only: [:show, :edit, :update, :destroy]

  # GET /boxes
  def index
    @boxes = current_user.boxes.page(params[:page]).per(10)
  end

  # GET /boxes/1
  def show
    @item = Item.new
  end

  # GET /boxes/new
  def new
    @box = Box.new
  end

  # GET /boxes/1/edit
  def edit
  end

  # POST /boxes
  def create
    @box = Box.new(box_params)

    if @box.save
      message = 'Box was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @box, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /boxes/1
  def update
    if @box.update(box_params)
      redirect_to @box, notice: 'Box was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /boxes/1
  def destroy
    @box.destroy
    message = "Box was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to boxes_url, notice: message
    end
  end


  private

  def current_user_must_be_box_user
    set_box
    unless current_user == @box.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def box_params
      params.require(:box).permit(:name, :user_id, :category_id)
    end
end
