require "rails_helper"

RSpec.describe Item, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:box) }
  end

  describe "InDirect Associations" do
    it { should have_one(:user) }
  end

  describe "Validations" do
  end
end
