require "rails_helper"

RSpec.describe BoxResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "boxes",
          attributes: {},
        },
      }
    end

    let(:instance) do
      BoxResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Box.count }.by(1)
    end
  end

  describe "updating" do
    let!(:box) { create(:box) }

    let(:payload) do
      {
        data: {
          id: box.id.to_s,
          type: "boxes",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      BoxResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { box.reload.updated_at }
      # .and change { box.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:box) { create(:box) }

    let(:instance) do
      BoxResource.find(id: box.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Box.count }.by(-1)
    end
  end
end
