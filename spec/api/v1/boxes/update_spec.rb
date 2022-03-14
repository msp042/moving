require 'rails_helper'

RSpec.describe "boxes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/boxes/#{box.id}", payload
  end

  describe 'basic update' do
    let!(:box) { create(:box) }

    let(:payload) do
      {
        data: {
          id: box.id.to_s,
          type: 'boxes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BoxResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { box.reload.attributes }
    end
  end
end
