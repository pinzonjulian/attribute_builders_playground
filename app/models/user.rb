class User
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name
  attribute :age, :integer
  attribute :email
  attribute :password
  attribute :active, :boolean
  attribute :onboarded, :boolean
end