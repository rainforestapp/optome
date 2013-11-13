require 'sidekiq'

class TextRecognizer
  def self.execute file_name
    puts `tesseract #{file_name} #{file_name}`
  end
end

class SnapWorker
  include Sidekiq::Worker

  def perform file_name
    # TODO save
    # TODO thumbs
  end
end

class ScreenGrabProcessor
  def initialize
    @queue = Sidekiq::Queue.new
  end

  def enqueue screen_grab
    SnapWorker.perform_async(screen_grab[:file_name])
    true 
  end
end
