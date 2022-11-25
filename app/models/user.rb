class User < ApplicationRecord
  has_many :books, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  def username
    return self.email.split('@')[0].capitalize
  end

end
