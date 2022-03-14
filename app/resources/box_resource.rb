class BoxResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :user_id, :integer
  attribute :category_id, :integer

  # Direct associations

  # Indirect associations

end
