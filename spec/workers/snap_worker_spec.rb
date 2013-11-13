require 'spec_helper'

PHOTO_FILE = File.join(Rails.root, "/spec/resources/drop.png")

describe SnapWorker do
  describe 'perform' do
    it "persists a snap" do
      w = SnapWorker.new
      expect do
        w.perform PHOTO_FILE
      end.to change(Snap, :count).by(1)
    end
  end
end
