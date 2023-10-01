class User < ApplicationRecord

  HUMANIZED_ATTRIBUTES = {
    :indentificationNumber => "Id Number",
    :startDate => "Document Start Date",
    :endDate => "Document End Date",
    :mainNumber => "Main Number",
    :optNumber  => "Secondary Number",
  }

  belongs_to :person_type
  validates :indentificationNumber, presence: true, format: { with: /\A[+-]?\d+\z/, message: "Only numbers allowed" },uniqueness: true,
  length: {minimum: 7, maximum: 12, too_short: "Must have at least 7 numbers", too_long: "Must have at most 12 numbers"}
  validates :startDate, presence: true , comparison: { less_than: :endDate, message: "Must be less than document end date"}
  validates :endDate, presence: true, comparison: { greater_than: :startDate, message: "Must be greater than document start date"}
  validates :name, presence: true, format: { with: /\A[^0-9`!@#"\{\}\[\]\$%\^&*+_=]+\z/, message: "Only letters allowed"  },
  length: {minimum: 3, maximum: 30, too_short: "Must have at least 4 letters", too_long: "Must have at most 30 letters"}
  validates :email, presence: true ,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "invalid"  }, 
    uniqueness: { case_sensitive: false }, 
    length: { minimum: 4, maximum: 254 }
  validates :mainNumber, presence: true, format: { with: /\A[+-]?\d+\z/, message: "Only numbers allowed" }
  validates :optNumber, format: { with: /\A[+-]?\d+\z/, message: "Only numbers allowed" }, if: Proc.new { |a| !a.optNumber.empty? }
  validates :person_type_id, presence: true

  def self.human_attribute_name(attr, options = {}) # 'options' wasn't available in Rails 3, and prior versions.
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

end
