require "rails_helper"

RSpec.describe BoxResource, type: :resource do
  describe "serialization" do
    let!(:box) { create(:box) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(box.id)
      expect(data.jsonapi_type).to eq("boxes")
    end
  end

  describe "filtering" do
    let!(:box1) { create(:box) }
    let!(:box2) { create(:box) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: box2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([box2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:box1) { create(:box) }
      let!(:box2) { create(:box) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      box1.id,
                                      box2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      box2.id,
                                      box1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
