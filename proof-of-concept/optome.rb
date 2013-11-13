require 'securerandom'


class ScreenCapture
  attr_reader :date_created, :file_name

  def initialize args
    @date_created = args[:time]
    @file_name = "#{args[:time].to_s.delete(' ')}#{args[:name]}.png"
    `screencapture -x #{@file_name}`
  end

end


class TextRecognizer
  def self.execute file_name
    puts `tesseract #{file_name} #{file_name}`
  end
end


def main
  while true do
    cap = ScreenCapture.new(name: SecureRandom.hex, time: Time.now)
    TextRecognizer.execute cap.file_name
  end
end


main()
