
class User
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name
  attribute :age, :integer
  attribute :email
  attribute :password
  attribute :active, :boolean
  attribute :onboarded, :boolean

  validates :name, length: { minimum: 2, maximum: 80 }
  validates_presence_of :name, :age, :email, :password
end