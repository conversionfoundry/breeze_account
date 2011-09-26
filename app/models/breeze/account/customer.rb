module Breeze
  module Account
    class Customer
      include Mongoid::Document


      field :first_name
      field :last_name

      # Include default devise modules. Others available are:
      # :token_authenticatable, :confirmable, :lockable and :timeoutable
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable

    end
  end
end

