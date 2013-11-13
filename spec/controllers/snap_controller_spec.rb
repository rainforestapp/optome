require 'spec_helper'

describe SnapController do
  describe 'search' do
    let(:query_params) do
      {
        q: "test"
      }
    end

    it 'should return 200 with a snap' do
      @snap = Snap.create(text: "this is a test")
      get :search, query_params
      puts response.body
      response.should be_success
    end

    it 'should return 400 if no query provided' do
      @snap = Snap.create(text: "this is a test")
      get :search, {}
      response.status.should == 400
    end
  end

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

    it "should return 400 if no photo provided" do
      post :upload, {}
      response.status.should == 400
    end
  end
end
