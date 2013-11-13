class ScreenGrabProcessor
  def initialize
    @queue = Sidekiq::Queue.new
  end

  def enqueue snap
    return false unless snap[:file_name].present?
    SnapWorker.perform_async(snap[:file_name])
    ThumbWorker.perform_async(snap[:file_name])
    true 
  end
end
