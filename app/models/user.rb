class User < ApplicationRecord

  # Coleccion de atributos para mostrar mensajes en el html

  HUMANIZED_ATTRIBUTES = {
    :indentificationNumber => "Id Number",
    :startDate => "Document Start Date",
    :endDate => "Document End Date",
    :mainNumber => "Main Number",
    :optNumber  => "Secondary Number",
  }

  # Definicio del modelo User con sus distintas validaciones. Se decidio que el numero de identificacion y el email
  # sean unicos para cada usuario, por lo que no pueden existir dos usuarios con el mismo numero de identificacion o email.
  # Adicionalmente el numero de identificacion debe ser un numero y tener entre 7 y 12 digitos, la fecha de inicio debe ser
  # menor a la fecha de fin, el nombre debe ser unicamente letras y tener entre 3 y 30 caracteres, el email debe ser un email
  # formato adecuado de email (Utilize la libreria email_validator para validar el formato del email, pero logre obtener un 
  # comportamiento similar con format y un regex de manera que deje la validacion con el regex) y tener entre 4 y 254 de longitud.
  # Para ambos campos de numero de telefono se utilizo un regex para validar que solo sean numeros, y con un 
  # 
  # 0412 921 46 68
  # 
  # 
  # 
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
  validates :mainNumber, presence: true, format: { with: /\A[+-]?\d+\z/, message: "Only numbers allowed" }, 
  length: {minimum: 11, maximum: 11, too_short: "Must have at least 11 digits", too_long: "Must have at most 11 digits"}
  validates :optNumber, format: { with: /\A[+-]?\d+\z/, message: "Only digits allowed" },
  length: {minimum: 11, maximum: 11, too_short: "Must have at least 11 digits", too_long: "Must have at most 11 digits"}, 
  if: Proc.new { |a| !a.optNumber.empty? }
  validates :person_type_id, presence: true

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

end
