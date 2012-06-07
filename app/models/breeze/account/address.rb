module Breeze
  module Account
    class Address
      include Mongoid::Document
     
      field :first_name
      field :last_name
      field :address_line_one
      field :address_line_two
      field :address_line_three
      field :region
      field :city
      field :country
      field :postcode

      embedded_in :customer, :class_name => "Breeze::Account::Customer", :inverse_of => :billing_address
      embedded_in :customer, :class_name => "Breeze::Account::Customer", :inverse_of => :shipping_address
    end
  end
end

