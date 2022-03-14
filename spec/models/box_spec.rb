require 'rails_helper'

RSpec.describe Box, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:items) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
