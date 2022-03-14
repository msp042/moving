class BoxesController < ApplicationController
  before_action :current_user_must_be_box_user,
                only: %i[edit update destroy]

  before_action :set_box, only: %i[show edit update destroy]

  def index
    @q = current_user.boxes.ransack(params[:q])
    @boxes = @q.result(distinct: true).includes(:user, :items,
                                                :category).page(params[:page]).per(10)
  end

  def show
    @item = Item.new
  end

  def new
    @box = Box.new
  end

  def edit; end

  def create
    @box = Box.new(box_params)

    if @box.save
      message = "Box was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @box, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @box.update(box_params)
      redirect_to @box, notice: "Box was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @box.destroy
    message = "Box was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to boxes_url, notice: message
    end
  end

  private

  def current_user_must_be_box_user
    set_box
    unless current_user == @box.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:name, :user_id, :category_id)
  end
end
