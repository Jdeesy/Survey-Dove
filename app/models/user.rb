class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :created_surveys, class_name: "Survey", foreign_key: "creator_id"
  has_many :responses
  has_many :choices, through: :responses
  has_many :questions, through: :choices
  has_many :taken_surveys, through: :questions, source: :survey

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(user_input)
    if user_input.length >= 8
      @password = BCrypt::Password.create(user_input)
      self.password_hash = @password
    else
      self.errors[:password] << "Must be greater than or equal to 8 characters"
    end
  end

  def

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    return @user if @user && @user.password_hash == password
  end
end
