require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:boxes) }
  end

  describe "InDirect Associations" do
    it { should have_many(:items) }
  end

  describe "Validations" do
  end
end
