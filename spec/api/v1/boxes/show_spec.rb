require 'rails_helper'

RSpec.describe "boxes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/boxes/#{box.id}", params: params
  end

  describe 'basic fetch' do
    let!(:box) { create(:box) }

    it 'works' do
      expect(BoxResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('boxes')
      expect(d.id).to eq(box.id)
    end
  end
end
