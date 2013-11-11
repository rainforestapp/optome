require 'securerandom'
require 'uuid'

class Capture
  attr_reader :datetime, :name
  def initialize h
    @datetime = h[:time]
    @name = h[:name]
    fname = "#{h[:time].to_s.delete(' ')}#{h[:name]}.png"
    `screencapture -x #{fname}`
  end
end

# TODO screenshot
# TODO OCR
# TODO text
# TODO timestamp

def main
  while true do
    c = Capture.new(name: SecureRandom.hex, time: Time.now)
    puts c.inspect
    # `tesseract #{fname} #{fname}.txt`
    sleep(1)
  end
end

main()
