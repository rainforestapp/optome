class SnapController < ApplicationController
  before_filter :init_processor

  respond_to :json

  def upload
    if @processor.enqueue params[:snap]
      render json: { status: 200 }, status: :ok
    else
      render json: { status: 400 }, status: :bad_request
    end
  end

  private

  def init_processor
    @processor ||= ScreenGrabProcessor.new
  end
end
