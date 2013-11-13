class SnapController < ApplicationController
  before_filter :init_processor

  respond_to :json

  def index
    render template: "snap/index"
  end

  def upload
    if @processor.enqueue snap_params
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def search 
    @snaps = Snap.find_with_text query_params
    render json: @snaps
  end

  private

  def init_processor
    @processor ||= ScreenGrabProcessor.new
  end

  def query_params
    params.require(:q)
  end

  def snap_params
    params.require(:snap).permit(:file_name)
  end

  rescue_from(ActionController::ParameterMissing) do
    render json: {}, status: :bad_request
  end
end
