
class User
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name # text
  attribute :age, :integer # number
  attribute :email # email
  attribute :password # password
  attribute :search # search
  attribute :telephone # tel
  attribute :website # url

  attribute :active, :boolean # checkbox
  attribute :onboarded, :boolean # switch
  attribute :volume, :integer # slider/range
  attribute :preferred_medium_of_transportation, :integer

  validates :name, length: { minimum: 2, maximum: 80 }
  validates_presence_of :name, :age, :email, :password
end