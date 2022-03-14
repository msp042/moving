class Item < ApplicationRecord
  # Direct associations

  belongs_to :box

  # Indirect associations

  has_one    :user,
             through: :box,
             source: :user

  has_one    :category,
             through: :box,
             source: :category

  # Validations

  # Scopes

  def to_s
    title
  end
end
