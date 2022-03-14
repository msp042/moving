class User < ApplicationRecord
  # Direct associations

  has_many   :boxes,
             :dependent => :destroy

  # Indirect associations

  has_many   :items,
             :through => :boxes,
             :source => :items

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
