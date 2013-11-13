require 'spec_helper'

describe SnapController do
  describe 'upload' do
    let(:valid_params) do
      {
        snap: {
          file_name: "foo.txt"
        }
      }
    end

    it "should return 200 if successful" do
      post :upload, valid_params
      response.should be_success
    end

    it "should enqueue a job" do
      q = Sidekiq::Queue.new

      expect do
        post :upload, valid_params
      end.to change(q, :size).by(1)
    end

    it "should return 400 if no photo provided"
  end
end
