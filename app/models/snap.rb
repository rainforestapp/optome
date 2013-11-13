class Snap < ActiveRecord::Base

  def self.find_with_text query
    query.downcase!
    snaps = Snap.all

    results = []
    snaps.each do |snap|
      found = false
      if snap.text.downcase.include? query
        results << snap
      end
    end
    results
  end
end
