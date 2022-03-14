require "rails_helper"

RSpec.describe "boxes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/boxes", params: params
  end

  describe "basic fetch" do
    let!(:box1) { create(:box) }
    let!(:box2) { create(:box) }

    it "works" do
      expect(BoxResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["boxes"])
      expect(d.map(&:id)).to match_array([box1.id, box2.id])
    end
  end
end
