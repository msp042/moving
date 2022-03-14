require "rails_helper"

RSpec.describe "boxes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/boxes/#{box.id}"
  end

  describe "basic destroy" do
    let!(:box) { create(:box) }

    it "updates the resource" do
      expect(BoxResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Box.count }.by(-1)
      expect { box.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
