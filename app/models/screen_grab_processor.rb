require 'sidekiq'

class TextRecognizer
  def self.execute file_name
    `tesseract #{file_name} #{file_name}`
    "#{file_name}.txt"
  end
end

class SnapWorker
  include Sidekiq::Worker

  def perform file_name
    text_fname = TextRecognizer.execute file_name
    # TODO save
    # TODO thumbs
  end
end

class ScreenGrabProcessor
  def initialize
    @queue = Sidekiq::Queue.new
  end

  def enqueue snap
    return false unless snap[:file_name].present?
    SnapWorker.perform_async(snap[:file_name])
    true 
  end
end
