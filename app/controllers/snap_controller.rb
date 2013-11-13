class SnapController < ApplicationController
  respond_to :json

  def upload
    if @processor.enqueue params[:screen_grab]
      render json: { status: 200 }, status: :ok
    else
      render json: { status: 400 }, status: :bad_request
    end
  end
end
