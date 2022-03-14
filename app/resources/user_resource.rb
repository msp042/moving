class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string

  # Direct associations

  has_many :boxes

  # Indirect associations

  has_many :items do
    assign_each do |user, items|
      items.select do |i|
        i.id.in?(user.items.map(&:id))
      end
    end
  end
end
