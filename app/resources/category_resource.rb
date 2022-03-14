class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  # Direct associations

  has_many :boxes

  # Indirect associations

  has_many :items do
    assign_each do |category, items|
      items.select do |i|
        i.id.in?(category.items.map(&:id))
      end
    end
  end
end
