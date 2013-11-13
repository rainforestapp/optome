class ThumbWorker
  include Sidekiq::Worker

  def perform input_filename
    output_name = Rails.root.join('public', 'images', 'thumbs', Pathname.new(input_filename.to_s).basename)

    `convert -thumbnail x300 #{input_filename} #{output_name}`
  end
end

