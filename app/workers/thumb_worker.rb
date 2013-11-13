class ThumbWorker
  include Sidekiq::Worker

  def perform input_filename
    output_name = Rails.root.join('data', 'thumbs', Pathname.new(input_filename).basename)

    Thumbnail.create(
      in: input_filename, 
      out: output_name,
      height: 100
    )
  end
end

