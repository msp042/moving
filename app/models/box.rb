class Box < ApplicationRecord
  # Direct associations

  belongs_to :category

  has_many   :items,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
