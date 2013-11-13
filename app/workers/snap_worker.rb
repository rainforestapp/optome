class SnapWorker
  include Sidekiq::Worker

  def perform file_name
    text_fname = TextRecognizer.execute file_name

    @snap = Snap.new
    @snap.file_name = file_name
    @snap.text = File.read(text_fname)
    @snap.save
  end
end

