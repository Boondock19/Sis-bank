class User < ApplicationRecord
  belongs_to :person_type, optional: true
  validates :indentificationNumber, presence: true
  validates :startDate, presence: true
  validates :endDate, presence: true
  validates :name, presence: true, format: { with: /\A[^0-9`!@#"\{\}\[\]\$%\^&*+_=]+\z/, message: "Only letters allowed"  }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Email invalid"  }, 
    uniqueness: { case_sensitive: false }, 
    length: { minimum: 4, maximum: 254 }
  validates :mainNumber, presence: true
  validates :person_type_id, presence: true
end
