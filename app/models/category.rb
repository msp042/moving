class Category < ApplicationRecord
  # Direct associations

  has_many   :boxes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
