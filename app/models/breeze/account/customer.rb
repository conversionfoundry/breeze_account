module Breeze
  module Account
    class Customer
      include Mongoid::Document



      # Include default devise modules. Others available are:
      # :token_authenticatable, :confirmable, :lockable and :timeoutable
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable

    end
  end
end

