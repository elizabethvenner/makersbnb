require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :first_name,     String
  property :surname,        String
  property :email,          String, required: true, format: :email_address, unique: true,
    messages: {
      presence: "Email is mandatory",
      format: "Please enter a correct email address",
      is_unique: "This email is already in use"
    }
  property :password_digest, BCryptHash

  has n, :spaces

  attr_reader :password
  attr_accessor :password_confirmation


  validates_uniqueness_of :email
  validates_confirmation_of :password, :message => "Sorry, Passwords mismatch!!"


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
