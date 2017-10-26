class User < ApplicationRecord
  rolify strict: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :recoverable, :rememberable,
          :trackable, :validatable, :confirmable

end
