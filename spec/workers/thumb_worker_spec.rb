require 'spec_helper'

describe ThumbWorker do
  describe 'perform' do
    let(:photo_file) { File.join(Rails.root, "/spec/resources/drop.png") }

    it "tries to make a Thumbnail" do
      Thumbnail.should_receive(:create).once
      ThumbWorker.new.perform(photo_file)
    end
  end
end
