class Box < ApplicationRecord
  # Direct associations

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
