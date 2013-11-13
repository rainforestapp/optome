class TextRecognizer
  def self.execute file_name
    `tesseract #{file_name} #{file_name}`
    "#{file_name}.txt"
  end
end

