class SnapController < ApplicationController
  before_filter :init_processor

  respond_to :json

  def upload
    if @processor.enqueue snap_params
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def init_processor
    @processor ||= ScreenGrabProcessor.new
  end

  def snap_params
    params.require(:snap).permit(:file_name)
  end

  rescue_from(ActionController::ParameterMissing) do
    render json: {}, status: :bad_request
  end
end
