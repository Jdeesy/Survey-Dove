class User < ActiveRecord::Base
  include BCrypt
  ############# 
  # relations #
  #############
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true,
                       :uniqueness => true
  validates :email,    :presence => true,
                       :uniqueness => true,
                       :format => { :with => /\w+@\w+\.\w+/ }
  validates :password, :presence => true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
    self.save
  end

  def self.authenticate(username, input_password)
    user = User.find_by(username: username)
    if user && user.password == input_password
      return user
    else
      return nil
    end
  end
end
