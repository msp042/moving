class Api::V1::BoxesController < Api::V1::GraphitiController
  def index
    boxes = BoxResource.all(params)
    respond_with(boxes)
  end

  def show
    box = BoxResource.find(params)
    respond_with(box)
  end

  def create
    box = BoxResource.build(params)

    if box.save
      render jsonapi: box, status: 201
    else
      render jsonapi_errors: box
    end
  end

  def update
    box = BoxResource.find(params)

    if box.update_attributes
      render jsonapi: box
    else
      render jsonapi_errors: box
    end
  end

  def destroy
    box = BoxResource.find(params)

    if box.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: box
    end
  end
end
