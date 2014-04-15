class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :store
  before_save :encrypt_password
  attr_accessor :password, :password_salt, :password_hash, :salt

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(username_or_email="", login_password="")
    user = User.find_by_email(username_or_email)

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def encrypt_password
    self.encrypted_password = BCrypt::Password.create(password) if password.present?
  end

  def match_password(login_password="")
    BCrypt::Password.new(self.encrypted_password) == login_password
  end
end