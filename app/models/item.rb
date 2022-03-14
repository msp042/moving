class Item < ApplicationRecord
  # Direct associations

  belongs_to :box

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
