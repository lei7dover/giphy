class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :login
  end

  has_many :gifs
  #validates_presence_of :login, :password, :message => "missing"
  #has_many :votes

end
